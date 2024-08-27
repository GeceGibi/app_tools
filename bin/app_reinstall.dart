import 'dart:io';

import 'package:app_tools/worker.dart';
import 'package:args/args.dart';

Future<void> main(List<String> args) async {
  var parser = ArgParser()
    ..addFlag('clean', abbr: 'c', defaultsTo: true)
    ..addFlag('verbose', abbr: 'v', defaultsTo: false);

  final result = parser.parse(args);
  final pwd = Directory.current.path;

  final iosDir = Directory('$pwd/ios');
  final l10nConfig = File('$pwd/l10n.yaml');

  final works = <Work>[
    if (result['clean'])
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
        '--delete-conflicting-outputs'
      ],
    ),
  ];

  final ext = '#' * 24;

  Printer.yellow.log('\n$ext re-install started $ext\n');
  Printer.cyan.log('pwd: $pwd\n');

  for (final work in works) {
    await Worker.run(work, verbose: result['verbose']);
    print('\n');
  }

  Printer.yellow.log('$ext re-install end $ext');
}
