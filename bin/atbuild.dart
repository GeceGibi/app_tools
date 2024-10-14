import 'dart:convert';
import 'dart:io';
import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';
import 'package:args/args.dart';
import 'package:intl/intl.dart' show DateFormat;

final cwd = Directory.current.path;
final versions = <String, Version>{};
const template = '''
{
  "google": {
    "build_name": "1.0.0",
    "build_number": 1,
    "build_number_pattern": "1yyMMddHH"
  },
  "huawei": {
    "build_name": "1.0.0",
    "build_number": 1,
    "build_number_pattern": "1yyMMddHH"
  },
  "ios": {
    "build_name": "1.0.0",
    "build_number": 1,
    "build_number_pattern": "1yyMMdd"
  }
}''';

String upgradeVersionName(String versionName, {String? type}) {
  return versionName;

  // final segments = versionName.split('.').map(int.parse).toList();

  // ///
  // switch (type) {
  //   case 'major':
  //     segments[0] = ++segments[0];

  //   case 'minor':
  //     segments[1] = ++segments[1];

  //   default:
  //     segments[segments.length - 1] = ++segments[segments.length - 1];
  // }

  // return segments.join('.');
}

void readEnvFile(File file) {
  final data = Map<String, dynamic>.from(
    jsonDecode(file.readAsStringSync()) as Map,
  );

  versions.addEntries([
    for (final entry in data.entries)
      MapEntry(
        entry.key,
        Version.fromJson(Map<String, dynamic>.from(entry.value as Map)),
      ),
  ]);
}

void updateEnvFile(File file) {
  const encoder = JsonEncoder.withIndent('  ');
  final bytes = utf8.encode(
    encoder.convert(
      versions.map((key, value) {
        return MapEntry(key, value.toJson());
      }),
    ),
  );

  file.writeAsBytesSync(bytes);
}

(String, int) generateVersion(String platform, {String? type}) {
  final now = DateTime.now();

  final Version(
    buildName: prevVersionName,
    buildNumber: prevVersionNumber,
    :buildNumberPattern,
  ) = versions[platform]!;

  var pattern = buildNumberPattern ?? 'yymmdd';
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

Future<void> updateProjectFiles(
  String platform,
  String buildName,
  int buildNumber,
) async {
  if (platform == 'ios') {
    await iOSUpdatePlist(buildName, buildNumber);
  }

  await updateYaml(buildName, buildNumber);
}

Future<void> updateYaml(String buildName, int buildNumber) async {
  final pubspecFile = File('$cwd/pubspec.yaml');
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

Future<void> iOSUpdatePlist(String buildName, int buildNumber) async {
  final pListFile = File('$cwd/ios/Runner/Info.plist');
  final pListLines = await pListFile.readAsLines();
  final pattern = RegExp(r'\t');

  for (var i = 0; i < pListLines.length; i++) {
    final line = pListLines[i];

    if (line.contains('CFBundleShortVersionString')) {
      final indent = '\t' * pattern.allMatches(line).length;
      pListLines[i + 1] = '$indent<string>$buildName</string>';
    } else if (line.contains('CFBundleVersion')) {
      final indent = '\t' * pattern.allMatches(line).length;
      pListLines[i + 1] = '$indent<string>$buildNumber</string>';
    }
  }

  await pListFile.writeAsString(pListLines.join('\n').trim());
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
    ..addOption('file', help: '.version.json path', defaultsTo: '.version.json')
    ..addOption('flavor', abbr: 'f')
    ..addOption('version-type', abbr: 't', defaultsTo: 'version')
    ..addFlag(
      'deploy',
      abbr: 'd',
      help: [
        'Deploy to specified platform store.',
        'ios => AppStore',
        'google => PlayConsole',
        'huawei => AppGallery',
      ].join('\n'),
    )
    ..addFlag('production')
    ..addFlag('clean', abbr: 'c')
    ..addFlag('obfuscate', abbr: 'o', defaultsTo: true)
    ..addFlag('build', abbr: 'b')
    ..addFlag('verbose')
    ..addFlag('init')
    ..addFlag('help');

  final arguments = parser.parse(args);

  if (arguments.flag('help')) {
    print(parser.usage);
    return;
  }

  if (arguments.flag('init')) {
    final file = File('$cwd/.versions.json');

    if (file.existsSync()) {
      Printer.warning('Version file already exist.');
      return;
    }

    file
      ..createSync(recursive: true)
      ..writeAsStringSync(template);
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
  ) = generateVersion(platform, type: versionType);

  print('');
  Printer.info('*' * 60);
  Printer.info('Platform: $platform');
  Printer.info('Build Name: $buildName');
  Printer.info('Build Number: $buildNumber');
  Printer.info('Deploy to Production: ${arguments.flag('production')}');
  Printer.info('Working Directory: $cwd');
  Printer.info('*' * 60);
  print('');

  /// Update Project Files
  await updateProjectFiles(platform, buildName, buildNumber);

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

          /// Build type
          switch (platform) {
            'ios' => 'ipa',
            'google' => 'appbundle',
            'huawei' || _ => 'apk',
          },

          /// Flavor
          if (flavor != null) ...['--flavor', flavor],

          /// Obfuscate
          if (arguments.flag('obfuscate')) ...[
            '--obfuscate',
            '--split-debug-info=build/$platform/symbols',
          ],

          /// version
          '--build-number=$buildName',
          '--build-number=$buildNumber',
        ],
      ),

    /// Deploy
    if (arguments.flag('deploy'))
      Work(
        description: 'Deploying for platform $platform',
        command: 'bundle',
        arguments: [
          'exec',
          'fastlane',
          platform,
          'deploy',
          'build_name:$buildName',
          'build_number:$buildNumber',
          'production:${arguments.flag('production')}',
        ],
        onComplete: (statusCode) {
          versions[platform] = versions[platform]!;
        },
      ),
  ];

  for (final work in works) {
    await work.run(verbose: arguments.flag('verbose'));
    print('');
  }

  updateEnvFile(versionFile);
}
