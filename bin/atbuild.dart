import 'dart:convert';
import 'dart:io';

import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:args/args.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

final _defaultPlatforms = [
  'android',
  'web',
  'ios',
  'macos',
  'windows',
  'linux',
];

final String cwd = Directory.current.path;
final platforms = <String, Version>{};

String updateVersionName(
  Version version, {
  bool patch = false,
  bool minor = false,
  bool major = false,
}) {
  if (patch || minor || major) {
    final formatSegments = version.formatName.split('.');
    final nameSegments = version.name.split('.');

    if (formatSegments.length != nameSegments.length) {
      throw Exception('Version format is not valid');
    }

    if (patch) {
      final newPatch = '${int.parse(nameSegments[2]) + 1}';

      if (newPatch.length > formatSegments[2].length) {
        nameSegments[2] = '0';
        nameSegments[1] = '${int.parse(nameSegments[1]) + 1}';
      } else {
        nameSegments[2] = newPatch;
      }
    }
    ///
    else if (minor) {
      final newMinor = '${int.parse(nameSegments[1]) + 1}';

      if (newMinor.length > formatSegments[1].length) {
        nameSegments[1] = '0';
        nameSegments[0] = '${int.parse(nameSegments[0]) + 1}';
      } else {
        nameSegments[1] = newMinor;
      }
    } else if (major) {
      final newMajor = '${int.parse(nameSegments[0]) + 1}';

      if (newMajor.length <= formatSegments[0].length) {
        nameSegments[0] = newMajor;
      }
    }

    return nameSegments.join('.');
  }

  return version.name;
}

int updateVersionCode(Version version, {bool incrementCode = false}) {
  final now = DateTime.now();
  final dateFormat = DateFormat(version.formatCode);

  var versionCode = int.parse(dateFormat.format(now));

  if (incrementCode && versionCode <= version.code) {
    versionCode = version.code + 1;
  }

  return versionCode;
}

void readConfigFile(File file) {
  if (!file.existsSync()) {
    Printer.warning('Version file not found: ${file.absolute.path}');
    return;
  }

  final yamlFile = loadYaml(file.readAsStringSync()) as YamlMap;

  final configFile = Map<String, Map<String, dynamic>>.from(
    jsonDecode(jsonEncode(yamlFile.value)) as Map,
  );

  platforms.addAll(
    configFile.map((key, value) {
      return MapEntry(key, Version.fromJson(value));
    }),
  );
}

void updateConfigFile(File file) {
  final yamlEditor = YamlEditor(file.readAsStringSync());

  platforms.forEach((key, value) {
    yamlEditor.update([key], value.toJson());
  });

  file.writeAsStringSync(yamlEditor.toString());
}

Future<void> updatePlatformProjectYaml(
  String buildName,
  int buildNumber,
) async {
  final pubspecFile = File('$cwd/pubspec.yaml');

  if (!pubspecFile.existsSync()) {
    Printer.warning('pubspec.yaml file not found on ${pubspecFile.path}');
    return;
  }

  final pubspecLines = await pubspecFile.readAsLines();

  await pubspecFile.writeAsString(
    pubspecLines
        .map((line) {
          if (line.startsWith('version:')) {
            return 'version: $buildName+$buildNumber';
          }

          return line;
        })
        .join('\n')
        .trim(),
  );
}

String platformKey(String platform, {String? flavor}) {
  if (flavor == null) {
    return platform;
  }

  return '$flavor:$platform';
}

Version generateVersion(
  String platform, {
  String? flavor,
  String? wantedVersionName,
  bool patch = false,
  bool minor = false,
  bool major = false,
  bool incrementCode = false,
}) {
  final key = platformKey(platform, flavor: flavor);

  if (!platforms.containsKey(key)) {
    throw Exception('Version file not found: $key');
  }

  final version = platforms[key]!;

  final versionName =
      wantedVersionName ??
      updateVersionName(
        version,
        patch: patch,
        minor: minor,
        major: major,
      );

  final versionCode = updateVersionCode(version, incrementCode: incrementCode);

  platforms[key] = platforms[key]!.copyWith(
    version: '$versionName+$versionCode',
  );

  return platforms[key]!;
}

void initVersionFile() {
  final file = File('$cwd/.versions.yaml');

  if (file.existsSync()) {
    Printer.warning('Version file already exist.');
    return;
  }

  final yamlEditor = YamlEditor('');
  final availablePlatforms = <String, Map<String, dynamic>>{};

  for (final platform in _defaultPlatforms) {
    if (Directory(platform).existsSync()) {
      availablePlatforms[platform] = const Version().toJson();
    }
  }

  yamlEditor.update([], availablePlatforms);

  file
    ..createSync(recursive: true)
    ..writeAsStringSync(yamlEditor.toString());
  return;
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('platform', abbr: 'p', help: 'Platform name')
    ..addOption(
      'file',
      help: '.versions.yaml path',
      defaultsTo: '.versions.yaml',
    )
    ..addOption('flavor', abbr: 'f', help: 'Flavor name')
    ..addOption('version-name', abbr: 'v', help: 'Version name')
    ..addFlag('minor', help: 'Increment minor version')
    ..addFlag('major', help: 'Increment major version')
    ..addFlag('patch', help: 'Increment patch version')
    ..addFlag('increment-version-code', help: 'Increment code version')
    ..addFlag('verbose')
    ..addFlag('init', help: 'Initialize version file')
    ..addFlag('help');

  final arguments = parser.parse(args);

  if (arguments.flag('help')) {
    Printer.write(parser.usage);
    return;
  }

  if (arguments.flag('init')) {
    initVersionFile();
    return;
  }

  final versionFile = File(arguments.option('file')!);

  /// Read File
  readConfigFile(versionFile);

  final versionName = arguments.option('version-name');
  final platform = arguments.option('platform');
  final flavor = arguments.option('flavor');

  if (platform == null) {
    throw Exception('Platform is not specified');
  }

  final version = generateVersion(
    platform,
    flavor: flavor,
    wantedVersionName: versionName,
    patch: arguments.flag('patch'),
    minor: arguments.flag('minor'),
    major: arguments.flag('major'),
    incrementCode: arguments.flag('increment-version-code'),
  );

  Printer.write('');
  Printer.info('*' * 60);
  Printer.info('Platform: $platform');
  Printer.info('Build Name: ${version.name}');
  Printer.info('Build Number: ${version.code}');
  Printer.info('Working Directory: $cwd');
  Printer.info('*' * 60);
  Printer.write('');

  await updatePlatformProjectYaml(version.name, version.code);

  /// if everything ok update the version file.
  updateConfigFile(versionFile);
}
