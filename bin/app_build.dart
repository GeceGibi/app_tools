import 'dart:io';

import 'package:app_tools/worker.dart';
import 'package:args/args.dart';

void main(List<String> args) async {
  final parser = ArgParser()

    ///
    ..addFlag('build', abbr: 'b', defaultsTo: false)
    ..addFlag('verbose', abbr: 'v', defaultsTo: false)
    ..addFlag('obfuscate', abbr: 'o', defaultsTo: false)
    ..addFlag('clean-build', abbr: 'c', defaultsTo: false)

    ///
    ..addOption('major', abbr: 'm')
    ..addOption('flavor', abbr: 'f')
    ..addOption('number', abbr: 'n')
    ..addOption('version', abbr: 'w')
    ..addOption(
      'platform',
      abbr: 'p',
      allowed: ['google', 'huawei', 'ios'],
      defaultsTo: 'google',
    );

  final arguments = parser.parse(args);

  final version = arguments['version'];
  final platform = arguments['platform'];
  final major = arguments['major'] ?? version.split('.').first;
  final buildNumber = arguments['number'];

  final versionPattern = RegExp(r'^\d{1,}.\d]{1,}.\d{1,}$');

  if (version == null || !versionPattern.hasMatch(version)) {
    final message = [
      '',
      '$version has not valid version format. (pattern=${versionPattern.pattern})',
      'Example usage app_build -w 1.1.0 -p google',
      '',
    ];

    print(message.join('\n'));
    exit(1);
  }

  if (platform == null) {
    final message = [
      '',
      'Platform is not defined. ',
      'Example usage app_build -w 1.1.0 -p google',
      '',
    ];

    print(message.join('\n'));
    exit(1);
  }

  final builder = Builder(
    platform: platform,
    version: version,
    major: major,
    buildNumber: buildNumber,
  );

  if (await builder() && arguments['build']) {
    final packageType = Platform.ios == builder.platform ? 'ipa' : 'appbundle';

    Printer.yellow.log('${packageType.toUpperCase()} build started !');
    print(' ');

    if (arguments['clean-build']) {
      await Worker.run(
        Work(
          command: 'flutter',
          arguments: ['clean'],
          description: 'Clean Flutter Project',
        ),
        verbose: arguments['verbose'],
      );
      print(' ');
    }

    final work = Work(
      command: 'flutter',
      arguments: [
        'build',
        packageType,
        '--release',

        // Obfuscation
        if (arguments['obfuscate']) ...[
          '--obfuscate',
          '--split-debug-info=build/${builder.platform.name}/symbols'
        ],

        // Flavor
        if (arguments['flavor'] != null) ...['--flavor', arguments['flavor']]
      ],
      description: 'Building for ${builder.platform.name.toUpperCase()}',
    );

    final exitCode = await Worker.run(work, verbose: arguments['verbose']);

    if (exitCode == 0) {
      print(' ');
      Printer.green.log('Build Done !');
    }
  }
}

enum Platform { google, huawei, ios }

Platform getPlatform(String platform) {
  return switch (platform) {
    'google' => Platform.google,
    'huawei' => Platform.huawei,
    'ios' || _ => Platform.ios,
  };
}

class Builder {
  Builder({
    required String platform,
    required this.version,
    this.buildNumber,
    this.major,
  }) : platform = getPlatform(platform);

  final Platform platform;
  final String version;
  final String? buildNumber;
  final String? major;

  final pwd = Directory.current.path;

  Future<bool> call() async {
    try {
      final (version, build) = getVersion();

      await updateYaml(version, build);

      if (platform == Platform.ios) {
        await updatePList(version, build);
      }

      logVersion(version, build);
    } catch (e) {
      return false;
    }

    return true;
  }

  (String, String) getVersion() {
    if (buildNumber != null) {
      return (version, buildNumber!);
    }

    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final hour = now.hour.toString().padLeft(2, '0');
    final year = '${now.year}'.substring(2);

    var build = '$year$month$day';

    if (major != null) {
      build = '$major$build';
    }

    if (platform != Platform.ios) {
      build += hour;
    }

    return (version, build);
  }

  Future<void> updateYaml(String version, String build) async {
    final pubspec = File('$pwd/pubspec.yaml');
    final lines = await pubspec.readAsLines();

    final file = lines.map((line) {
      if (line.startsWith('version:')) {
        return 'version: $version+$build';
      }

      return line;
    });

    await pubspec.writeAsString(file.join('\n').trim());
  }

  Future<void> updatePList(String version, String build) async {
    final plist = File('$pwd/ios/Runner/Info.plist');
    final lines = await plist.readAsLines();
    final pattern = RegExp(r'\t');

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (line.contains('CFBundleShortVersionString')) {
        final indent = '\t' * pattern.allMatches(line).length;
        lines[i + 1] = '$indent<string>$version</string>';
      } else if (line.contains('CFBundleVersion')) {
        final indent = '\t' * pattern.allMatches(line).length;
        lines[i + 1] = '$indent<string>$build</string>';
      }
    }

    await plist.writeAsString(lines.join('\n').trim());
  }

  void logVersion(String version, String build) {
    final symbol = '#';
    final ornamental = symbol * 50;

    print('');
    Printer.green.log(ornamental);
    Printer.green.log('');
    Printer.green.log('');
    Printer.green.log(' Platform        :    ${platform.name}');
    Printer.green.log(' Version Name    :    $version');
    Printer.green.log(' Version Code    :    $build');
    // Printer.green.log(' Commit ID       :    \$COMMIT_ID');
    Printer.green.log('');
    Printer.green.log('');
    Printer.green.log(ornamental);
    print('');
  }
}
