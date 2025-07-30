import 'dart:io';
import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';
import 'package:args/args.dart';
import 'package:intl/intl.dart' show DateFormat;

final String cwd = Directory.current.path;
final versions = <String, Version>{};
const template = [
  'google=1.0.0+1|1yyMMddHH+',
  'huawei=1.0.0+1|1yyMMddHH+',
  'ios=1.0.0+1|1yyMMddHH+',
];

const defaultPattern = 'yymmdd';

String upgradeVersionName(String versionName, {String? type}) {
  // TODO: Implement version name upgrade logic
  return versionName;
}

void readEnvFile(File file) {
  if (!file.existsSync()) {
    Printer.warning('Version file not found: ${file.path}');
    return;
  }

  for (final line in file.readAsLinesSync()) {
    // Skip empty lines and comments
    if (line.trim().isEmpty || line.trim().startsWith('#')) {
      continue;
    }

    final platformSplit = line.split('=');
    final patternSplit = platformSplit.last.split('|');
    final versionSplit = patternSplit.first.split('+');

    if (platformSplit.length <= 1) {
      continue;
    }

    versions.addAll(
      {
        platformSplit.first: Version(
          buildName: versionSplit.first,
          buildNumber: int.parse(versionSplit.last),
          buildNumberPattern: patternSplit.length > 1
              ? patternSplit.last
              : null,
        ),
      },
    );
  }
}

void updateEnvFile(File file) {
  final lines = [
    for (final entry in versions.entries) entry.value.toEnvLine(entry.key),
  ];

  file.writeAsStringSync(lines.join('\n'));
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

(String, int) generateVersion(String platform, {String? type}) {
  if (!versions.containsKey(platform)) {
    throw Exception('Platform "$platform" not found in version file');
  }

  final now = DateTime.now();

  final Version(
    buildName: prevVersionName,
    buildNumber: prevVersionNumber,
    :buildNumberPattern,
  ) = versions[platform]!;

  var pattern = buildNumberPattern ?? defaultPattern;
  final autoIncrease = pattern.contains('+');

  if (autoIncrease) {
    pattern = pattern.replaceAll('+', '');
  }

  final dateFormat = DateFormat(pattern);

  final versionName = upgradeVersionName(prevVersionName, type: type);
  var versionNumber = int.parse(dateFormat.format(now));

  if (autoIncrease && versionNumber <= prevVersionNumber) {
    versionNumber = prevVersionNumber + 1;
  }

  versions[platform] = versions[platform]!.copyWith(
    buildName: versionName,
    buildNumber: versionNumber,
  );

  return (versionName, versionNumber);
}

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      'platform',
      abbr: 'p',
      help: 'Build runs for which platform',
      mandatory: true,
      allowed: ['ios', 'google', 'huawei'],
      allowedHelp: {
        'ios': 'Build ipa',
        'google': 'Build App Bundle (*.aab) file',
        'huawei': 'Build (*.apk) file',
      },
    )
    ..addOption(
      'file',
      help: '.versions.env path',
      defaultsTo: '.versions.env',
    )
    ..addOption('flavor', abbr: 'f')
    ..addOption('version-type', abbr: 't', defaultsTo: 'version')
    ..addFlag('production')
    ..addFlag('clean', abbr: 'c')
    ..addFlag('obfuscate', abbr: 'o', defaultsTo: true)
    ..addFlag('build', abbr: 'b')
    ..addFlag('verbose')
    ..addFlag('init')
    ..addFlag('help')
    ..addFlag('no-codesign', abbr: 's');

  final arguments = parser.parse(args);

  if (arguments.flag('help')) {
    Printer.write(parser.usage);
    return;
  }

  if (arguments.flag('init')) {
    final file = File('$cwd/.versions.env');

    if (file.existsSync()) {
      Printer.warning('Version file already exist.');
      return;
    }

    file
      ..createSync(recursive: true)
      ..writeAsStringSync(template.join('\n'));
    return;
  }

  final versionFile = File(arguments.option('file')!);

  /// Read File
  readEnvFile(versionFile);

  final platform = arguments.option('platform');
  final versionType = arguments.option('version-type');
  final flavor = arguments.option('flavor');

  if (platform == null) {
    throw Exception('Platform is not specified');
  }

  final (
    buildName,
    buildNumber,
  ) = generateVersion(
    platform,
    type: versionType,
  );

  Printer.write('');
  Printer.info('*' * 60);
  Printer.info('Platform: $platform');
  Printer.info('Build Name: $buildName');
  Printer.info('Build Number: $buildNumber');
  Printer.info('Working Directory: $cwd');
  Printer.info('*' * 60);
  Printer.write('');

  await updateYaml(buildName, buildNumber);

  final packageType = switch (platform) {
    'ios' => 'ipa',
    'google' => 'appbundle',
    'huawei' => 'apk',
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
          '--build-name=$buildName',
          '--build-number=$buildNumber',

          /// Code Sign
          if (arguments.flag('no-codesign')) '--no-codesign',

          /// Verbose
          if (arguments.flag('verbose')) '--verbose',
        ],
      ),
  ];

  for (final work in works) {
    await work.run(verbose: arguments.flag('verbose'));
    Printer.write('');
  }

  updateEnvFile(versionFile);
}
