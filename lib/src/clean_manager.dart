import 'dart:io';

import 'package:app_tools/printer.dart';
import 'package:app_tools/worker.dart';

class CleanManager {
  CleanManager({required this.pwd});

  final String pwd;

  Future<void> run({
    bool deep = false,
    bool quick = false,
    bool verbose = false,
  }) async {
    final iosDir = Directory('$pwd/ios');
    final l10nConfig = File('$pwd/l10n.yaml');
    final pubspecFile = File('$pwd/pubspec.yaml');
    final hasBuildRunner =
        pubspecFile.existsSync() &&
        pubspecFile.readAsStringSync().contains('build_runner:');

    final works = <Work>[
      Work(
        description: 'Clean Flutter Project',
        command: 'flutter clean',
        pwd: pwd,
      ),
      if (deep)
        Work(
          description: 'Remove Pub Lock Project',
          command:
              'rm -rf pubspec.lock .flutter-plugins '
              '.flutter-plugins-dependencies',
          pwd: pwd,
        ),

      ///! iOS
      if (iosDir.existsSync()) ...[
        Work(
          description: 'Pod deintegrate',
          command: 'pod deintegrate || true',
          pwd: iosDir.path,
        ),
        Work(
          description: 'Remove Pod File',
          command: 'rm -rf Pods',
          pwd: iosDir.path,
        ),
        Work(
          description: 'Remove Cached iOS Flutter Libs',
          command: 'rm -rf .symlinks Flutter/Generated.xcconfig',
          pwd: iosDir.path,
        ),
        if (deep) ...[
          Work(
            description: 'Remove Podfile.lock',
            command: 'rm -rf Podfile.lock',
            pwd: iosDir.path,
          ),
          Work(
            description: 'Clean CocoaPods Cache',
            command: 'pod cache clean --all',
            pwd: iosDir.path,
          ),
          Work(
            description: 'Remove Xcode DerivedData',
            command: 'rm -rf ~/Library/Developer/Xcode/DerivedData',
            pwd: iosDir.path,
          ),
        ],
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

      ///! Codegen
      if (!quick && l10nConfig.existsSync())
        Work(
          description: 'Generate L10N',
          command: 'flutter gen-l10n',
          pwd: pwd,
        ),
      if (!quick && hasBuildRunner)
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

    final stopwatch = Stopwatch()..start();
    for (final work in works) {
      final exitCode = await work.run(verbose: verbose);
      if (exitCode != 0) {
        Printer.error(
          'Execution stopped due to failure in: ${work.description}',
        );
        exit(exitCode);
      }
      Printer.write('');
    }
    stopwatch.stop();
    final elapsed = (stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(1);

    Printer.warning('Reinstall end (${elapsed}s).');
  }
}
