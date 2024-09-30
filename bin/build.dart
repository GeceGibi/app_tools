import 'dart:convert';
import 'dart:io';
import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:args/args.dart';
import 'package:collection/collection.dart';

const encoder = JsonEncoder.withIndent('    ');
final versionFile = File('versions.json');
final cwd = Directory.current.path;
final versions = <Version>[];

void updateVersionFile() {
  versionFile.writeAsBytesSync(
    utf8.encode(
      encoder.convert(versions.map((version) => version.toJson()).toList()),
    ),
  );
}

int generateBuildNumber(Version version) {
  if (version.buildNumberPattern == 'd+') {
    return version.buildNumber + 1;
  }

  return 0;
}

(String, int) getBuildVersion(Version version) {
  final now = DateTime.now();

  final Version(
    buildName: prevVersionName,
    buildNumber: prevVersionNumber,
    :uploaded
  ) = version;

  if (!uploaded) {
    return (prevVersionName, prevVersionNumber);
  }

  final year = '${now.year}'.substring(2);
  final month = '${now.month}'.padLeft(2, '0');
  final day = '${now.day}'.padLeft(2, '0');
  final hour = '${now.hour}'.padLeft(2, '0');

  final major = prevVersionName.split('.').first;

  var buildNumber = int.parse(
    switch (version.platform) {
      'ios' => '$major$year$month$day',
      _ => '$major$year$month$day$hour',
    },
  );

  if (buildNumber <= prevVersionNumber) {
    buildNumber = prevVersionNumber + 1;
  }

  return (version.buildName, buildNumber);
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
    ..addFlag('help');

  final arguments = parser.parse(args);

  if (arguments.flag('help')) {
    print(parser.usage);
    return;
  }

  /// Load json
  final data = (jsonDecode(versionFile.readAsStringSync()) as List)
      .cast<Map<String, dynamic>>();

  versions.addAll(data.map(Version.fromJson));

  final platform = arguments.option('platform');
  final version = versions.firstWhereOrNull((e) => e.platform == platform);

  if (platform == null || version == null) {
    throw Exception('Platform is not defined ($platform)');
  }

  final (buildName, buildNumber) = getBuildVersion(version);

  if (platform == 'ios') {
    await iOSUpdatePlist(buildName, buildNumber);
  }

  await updateYaml(buildName, buildNumber);

  print('Build starting..');
  Printer.info('Platform: $platform');
  Printer.info('Build Name: $buildName');
  Printer.info('Build Number: $buildNumber');
  Printer.info('Deploy to Production: ${arguments.flag('production')}');

  Printer.info('Working Directory: $cwd');

  final commands = <Command>[
    /// Clean
    if (arguments.flag('clean')) const Command('flutter', arguments: ['clean']),

    /// Build
    if (arguments.flag('build'))
      Command(
        'flutter',
        arguments: [
          'build',
          switch (platform) {
            'ios' => 'ipa',
            'google' => 'appbundle',
            'huawei' || _ => 'apk',
          },
          if (arguments.flag('obfuscate')) ...[
            '--obfuscate',
            '--split-debug-info=build/$platform/symbols',
          ],
          '--build-number=$buildName',
          '--build-number=$buildNumber',
        ],
      ),

    /// Deploy
    if (arguments.flag('deploy'))
      Command(
        'bundle',
        arguments: [
          'exec',
          'fastlane',
          platform,
          'deploy',
          'build_name:$buildName',
          'build_number:$buildNumber',
          'production:${arguments.flag('production')}',
        ],
        onComplete: (status) {},
      ),
  ];

  for (final command in commands) {
    Printer.warning('Running | $command');

    final process = await Process.start(
      command.executable,
      command.arguments,
      workingDirectory: cwd,
    )
      ..stdout.listen((e) => print(utf8.decode(e)))
      ..stderr.listen((e) => Printer.error(utf8.decode(e)));

    final exitCode = await process.exitCode;

    if (exitCode != 0) {
      print('Build failed..');
      command.onComplete?.call(false);
      exit(exitCode);
    }

    print('\n');
    Printer.success('Finished | $command');
    command.onComplete?.call(true);
  }

  updateVersionFile();
}

class Command {
  const Command(this.executable, {this.arguments = const [], this.onComplete});
  final String executable;
  final List<String> arguments;
  final void Function(bool status)? onComplete;

  @override
  String toString() => '$executable ${arguments.join(' ')}';
}
