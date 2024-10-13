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
        command: 'flutter',
        arguments: ['clean'],
        pwd: pwd,
      ),
    Work(
      description: 'Remove Pub Lock Project',
      command: 'rm',
      arguments: ['-rf', 'pubspec.lock'],
      pwd: pwd,
    ),

    ///! iOS
    if (iosDir.existsSync()) ...[
      Work(
        description: 'Pod deintegrate',
        command: 'pod',
        arguments: ['deintegrate'],
        pwd: iosDir.path,
      ),
      Work(
        description: 'Remove Pod File',
        command: 'rm',
        arguments: ['-rf', 'Pods'],
        pwd: iosDir.path,
      ),
      Work(
        description: 'Remove Cached iOS Flutter Libs',
        command: 'rm',
        arguments: ['-rf', '.symlinks'],
        pwd: iosDir.path,
      ),
      Work(
        description: 'Remove Podfile.lock',
        command: 'rm',
        arguments: ['-rf', 'Podfile.lock'],
        pwd: iosDir.path,
      ),
    ],

    ///! Home
    Work(
      description: 'Get flutter packages',
      command: 'flutter',
      arguments: ['pub', 'get'],
      pwd: pwd,
    ),

    ///! iOS
    if (iosDir.existsSync())
      Work(
        description: 'Pod install & update',
        command: 'pod',
        arguments: ['install', '--repo-update'],
        pwd: iosDir.path,
      ),

    ///! Home
    if (l10nConfig.existsSync())
      Work(
        description: 'Generate L10N',
        command: 'flutter',
        arguments: ['gen-l10n'],
        pwd: pwd,
      ),
    Work(
      description: 'Generate Freezed Models',
      command: 'dart',
      pwd: pwd,
      arguments: [
        'run',
        'build_runner',
        'build',
        '--delete-conflicting-outputs',
      ],
    ),
  ];

  print('');
  Printer.warning('Reinstall started..');
  Printer.info('pwd: $pwd');
  print('');

  for (final work in works) {
    await work.run(verbose: result.flag('verbose'));
    print('');
  }

  Printer.warning('Reinstall end.');
}
