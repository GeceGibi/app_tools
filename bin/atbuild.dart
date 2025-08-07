import 'dart:convert';
import 'dart:io';

import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';
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

String updateVersionName(Version version) {
  // TODO: Implement version name upgrade logic
  return version.name;
}

int updateVersionCode(Version version) {
  final now = DateTime.now();
  final dateFormat = DateFormat(version.format);

  var versionCode = int.parse(dateFormat.format(now));

  if (version.autoIncrement && versionCode <= version.code) {
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

Version generateVersion(String platform, {String? flavor}) {
  final key = platformKey(platform, flavor: flavor);

  if (!platforms.containsKey(key)) {
    throw Exception('Version file not found: $key');
  }

  final version = platforms[key]!;

  final versionName = updateVersionName(version);
  final versionCode = updateVersionCode(version);

   platforms[key] =  platforms[key]!.copyWith(
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
    // if (Directory(platform).existsSync()) {
    availablePlatforms[platform] = const Version().toJson();
    // }
  }

  yamlEditor.update([], availablePlatforms);

  file
    ..createSync(recursive: true)
    ..writeAsStringSync(yamlEditor.toString());
  return;
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('platform', abbr: 'p', help: 'Update version for platform')
    ..addOption(
      'file',
      help: '.versions.yaml path',
      defaultsTo: '.versions.yaml',
    )
    ..addOption('flavor', abbr: 'f')
    ..addFlag('verbose')
    ..addFlag('init')
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



  final platform = arguments.option('platform');
  final flavor = arguments.option('flavor');

  if (platform == null) {
    throw Exception('Platform is not specified');
  }

  final version = generateVersion(platform, flavor: flavor);


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
