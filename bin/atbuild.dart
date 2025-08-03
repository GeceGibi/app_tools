import 'dart:convert';
import 'dart:io';

import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';
import 'package:app_tools/yaml.dart';
import 'package:args/args.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

final defaultVersions = {
  'android': const PlatformEntry(build: Build(package: 'appbundle')),
  'web': const PlatformEntry(build: Build(package: 'web')),
  'ios': const PlatformEntry(build: Build(package: 'ipa')),
  'macos': const PlatformEntry(build: Build(package: 'macos')),
  'windows': const PlatformEntry(build: Build(package: 'windows')),
  'linux': const PlatformEntry(build: Build(package: 'linux')),
};

final String cwd = Directory.current.path;
final platforms = <String, PlatformEntry>{};

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
      return MapEntry(key, PlatformEntry.fromJson(value));
    }),
  );
}

void updateConfigFile(File file) {
  final jsonData = platforms.map((key, value) => MapEntry(key, value.toJson()));
  file.writeAsStringSync(jsonToYaml(jsonData));
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

PlatformEntry generateVersion(String platform, {String? flavor}) {
  final key = platformKey(platform, flavor: flavor);

  if (!platforms.containsKey(key)) {
    throw Exception('Version file not found: $key');
  }

  final PlatformEntry(:version) = platforms[key]!;

  final versionName = updateVersionName(version);
  final versionCode = updateVersionCode(version);

  platforms[key] = platforms[key]!.copyWith(
    version: version.copyWith(value: '$versionName+$versionCode'),
  );

  return platforms[key]!;
}

void initVersionFile() {
  final file = File('$cwd/.versions.yaml');

  if (file.existsSync()) {
    Printer.warning('Version file already exist.');
    return;
  }

  final availablePlatforms = defaultVersions.entries.where((entry) {
    final MapEntry(:key) = entry;
    return Directory(key).existsSync();
  });

  final jsonData = {
    for (final MapEntry(:key, :value) in availablePlatforms)
      key: value.toJson(),
  };

  file
    ..createSync(recursive: true)
    ..writeAsStringSync(jsonToYaml(jsonData));
  return;
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      'platform',
      abbr: 'p',
      help: 'Build runs for which platform',
      allowedHelp: defaultVersions.map((key, value) {
        return MapEntry(key, value.build.package);
      }),
    )
    ..addOption(
      'file',
      help: '.versions.yaml path',
      defaultsTo: '.versions.yaml',
    )
    ..addOption('flavor', abbr: 'f')
    ..addFlag('clean', abbr: 'c')
    ..addFlag('obfuscate', abbr: 'o', defaultsTo: true)
    ..addFlag('build', abbr: 'b')
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

  final PlatformEntry(:build, :version, :run) = generateVersion(
    platform,
    flavor: flavor,
  );

  Printer.write('');
  Printer.info('*' * 60);
  Printer.info('Platform: $platform');
  Printer.info('Build Name: ${version.name}');
  Printer.info('Build Number: ${version.code}');
  Printer.info('Working Directory: $cwd');
  Printer.info('*' * 60);
  Printer.write('');

  final variables = {
    'VERSION': version.value,
    'VERSION_NAME': version.name,
    'VERSION_CODE': version.code,
    'CWD': cwd,
    'PLATFORM': platform,
    'FLAVOR': flavor,
    ...Platform.environment,
  };

  await updatePlatformProjectYaml(version.name, version.code);

  if (run?.before != null) {
    final command = Work.replaceTemplate(
      run!.before!,
      variables: variables,
    );

    final exitCode = await Work(
      description: 'Running before command.',
      command: command,
    ).run(verbose: true);

    Printer.write('');

    if (exitCode != 0) {
      Printer.error('Run-Before command failed.');
      return;
    }
  }

  /// Commands
  final works = <Work>[
    /// Clean
    if (arguments.flag('clean'))
      const Work(
        description: 'Cleaning project.',
        command: 'flutter clean',
      ),

    /// Build
    if (arguments.flag('build'))
      Work(
        description: 'Build Starting.',
        command: [
          'flutter build',

          /// Package
          build.package,

          /// Flavor
          if (flavor != null) ...['--flavor', flavor],

          /// Obfuscate
          if (arguments.flag('obfuscate')) ...[
            '--obfuscate',
            '--split-debug-info=build/$platform/symbols',
          ],

          /// version
          '--build-name=${version.name}',
          '--build-number=${version.code}',

          /// Verbose
          if (arguments.flag('verbose')) '--verbose',

          /// Platform Arguments
          ...?build.arguments,
        ].join(),
      ),
  ];

  var exitCode = 0;

  for (final work in works) {
    exitCode = await work.run(verbose: arguments.flag('verbose'));

    if (exitCode != 0) {
      Printer.error('Build failed.');
      return;
    }

    Printer.write('');
  }

  updateConfigFile(versionFile);

  if (run?.after != null) {
    final command = Work.replaceTemplate(
      run!.after!,
      variables: variables,
    );

    final exitCode = await Work(
      description: 'Running after command.',
      command: command,
    ).run(verbose: true);

    if (exitCode != 0) {
      Printer.error('Run-After command failed.');
      return;
    }
  }
}
