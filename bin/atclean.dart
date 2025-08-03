import 'dart:io';

import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';
import 'package:args/args.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser()
    ..addFlag('clean', abbr: 'c', defaultsTo: true)
    ..addFlag('verbose', abbr: 'v');

  final result = parser.parse(args);
  final pwd = Directory.current.path;

  final iosDir = Directory('$pwd/ios');
  final l10nConfig = File('$pwd/l10n.yaml');

  final works = <Work>[
    if (result.flag('clean'))
      Work(
        description: 'Clean Flutter Project',
        command: 'flutter clean',
        pwd: pwd,
      ),
    Work(
      description: 'Remove Pub Lock Project',
      command: 'rm -rf pubspec.lock',
      pwd: pwd,
    ),

    ///! iOS
    if (iosDir.existsSync()) ...[
      Work(
        description: 'Pod deintegrate',
        command: 'pod deintegrate',
        pwd: iosDir.path,
      ),
      Work(
        description: 'Remove Pod File',
        command: 'rm -rf Pods',
        pwd: iosDir.path,
      ),
      Work(
        description: 'Remove Cached iOS Flutter Libs',
        command: 'rm -rf .symlinks',
        pwd: iosDir.path,
      ),
      Work(
        description: 'Remove Podfile.lock',
        command: 'rm -rf Podfile.lock',
        pwd: iosDir.path,
      ),
    ],

    ///! Home
    Work(
      description: 'Get flutter packages',
      command: 'flutter pub get',
      pwd: pwd,
    ),

    ///! iOS
    if (iosDir.existsSync())
      Work(
        description: 'Pod install & update',
        command: 'pod install --repo-update',
        pwd: iosDir.path,
      ),

    ///! Home
    if (l10nConfig.existsSync())
      Work(
        description: 'Generate L10N',
        command: 'flutter gen-l10n',
        pwd: pwd,
      ),
    Work(
      description: 'Generate Freezed Models',
      command: 'dart run build_runner build --delete-conflicting-outputs',
      pwd: pwd,
    ),
  ];

  Printer.write('');
  Printer.warning('Reinstall started..');
  Printer.info('pwd: $pwd');
  Printer.write('');

  for (final work in works) {
    await work.run(verbose: result.flag('verbose'));
    Printer.write('');
  }

  Printer.warning('Reinstall end.');
}
