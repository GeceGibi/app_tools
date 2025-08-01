import 'dart:convert';
import 'dart:io';
import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';
import 'package:args/args.dart';
import 'package:intl/intl.dart' show DateFormat;

final defaultVersions = {
  'android': const Version(package: 'appbundle'),
  'web': const Version(package: 'web'),
  'ios': const Version(package: 'ipa'),
  'macos': const Version(package: 'macos'),
  'windows': const Version(package: 'windows'),
  'linux': const Version(package: 'linux'),
};

const jsonEncoder = JsonEncoder.withIndent('    ');
final String cwd = Directory.current.path;
final versions = <String, Version>{};

String updateVersionName(String versionName) {
  // TODO: Implement version name upgrade logic
  return versionName;
}

int updateVersionCode(String versionCodeFormat, int prevVersionCode) {
  final now = DateTime.now();

  var format = versionCodeFormat;

  final increase = format.contains('+');

  if (increase) {
    format = format.replaceAll('+', '');
  }

  final dateFormat = DateFormat(format);

  var versionCode = int.parse(dateFormat.format(now));

  if (increase && versionCode <= prevVersionCode) {
    versionCode = prevVersionCode + 1;
  }

  return versionCode;
}

void readConfigFile(File file) {
  if (!file.existsSync()) {
    Printer.warning('Version file not found: ${file.absolute.path}');
    return;
  }

  final configFile = Map<String, Map<String, dynamic>>.from(
    jsonDecode(file.readAsStringSync()) as Map,
  );

  versions.addAll(
    configFile.map(
      (key, value) => MapEntry(key, Version.fromJson(value)),
    ),
  );
}

void updateConfigFile(File file) {
  file.writeAsStringSync(
    jsonEncoder.convert(
      versions.map((key, value) => MapEntry(key, value.toJson())),
    ),
  );
}

Future<void> updateYaml(String buildName, int buildNumber) async {
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

  if (!versions.containsKey(key)) {
    throw Exception('Version file not found: $key');
  }

  final Version(
    versionName: prevVersionName,
    versionCode: prevVersionCode,
    :versionCodeFormat,
  ) = versions[key]!;

  final versionName = updateVersionName(prevVersionName);
  final versionCode = updateVersionCode(versionCodeFormat, prevVersionCode);

  versions[key] = versions[key]!.copyWith(
    versionName: versionName,
    versionCode: versionCode,
  );

  return versions[key]!;
}

void initVersionFile() {
  final file = File('$cwd/.versions.json');

  if (file.existsSync()) {
    Printer.warning('Version file already exist.');
    return;
  }

  final availablePlatforms = defaultVersions.entries.where((entry) {
    final MapEntry(:key, :value) = entry;
    return Directory(key).existsSync();
  });

  file
    ..createSync(recursive: true)
    ..writeAsStringSync(
      jsonEncoder.convert({
        for (final MapEntry(:key, :value) in availablePlatforms)
          key: value.toJson(),
      }),
    );
  return;
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      'platform',
      abbr: 'p',
      help: 'Build runs for which platform',
      allowedHelp: defaultVersions.map(
        (key, value) => MapEntry(key, value.package),
      ),
    )
    ..addOption(
      'file',
      help: '.versions.json path',
      defaultsTo: '.versions.json',
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

  final version = generateVersion(platform, flavor: flavor);

  Printer.write('');
  Printer.info('*' * 60);
  Printer.info('Platform: $platform');
  Printer.info('Build Name: ${version.versionName}');
  Printer.info('Build Number: ${version.versionCode}');
  Printer.info('Working Directory: $cwd');
  Printer.info('*' * 60);
  Printer.write('');

  await updateYaml(version.versionName, version.versionCode);

  final packageType =
      version.package ??
      switch (platform) {
        'ios' => 'ipa',
        'android' => 'appbundle',
        _ => 'apk',
      };

  /// Commands
  final works = <Work>[
    /// Clean
    if (arguments.flag('clean'))
      const Work(
        description: 'Cleaning project.',
        command: 'flutter',
        arguments: ['clean'],
      ),

    /// Build
    if (arguments.flag('build'))
      Work(
        description: 'Build Starting.',
        command: 'flutter',
        arguments: [
          'build',

          /// Package
          packageType,

          /// Flavor
          if (flavor != null) ...['--flavor', flavor],

          /// Obfuscate
          if (arguments.flag('obfuscate')) ...[
            '--obfuscate',
            '--split-debug-info=build/$platform/symbols',
          ],

          /// version
          '--build-name=${version.versionName}',
          '--build-number=${version.versionCode}',

          /// Verbose
          if (arguments.flag('verbose')) '--verbose',

          /// Platform Arguments
          ...version.arguments,
        ],
      ),
  ];

  for (final work in works) {
    await work.run(verbose: arguments.flag('verbose'));
    Printer.write('');
  }

  updateConfigFile(versionFile);
}
