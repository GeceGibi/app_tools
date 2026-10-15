import 'dart:io';

import 'package:app_tools/app_tools.dart';
import 'package:args/args.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser()
    ..addFlag('deep', abbr: 'd', help: 'Clean lock files & CocoaPods cache')
    ..addFlag('quick', abbr: 'q', help: 'Skip codegen (freezed & l10n)')
    ..addFlag('verbose', abbr: 'v', help: 'Print verbose logs')
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show this help');

  final result = parser.parse(args);

  if (result.flag('help')) {
    Printer.info(parser.usage);
    return;
  }

  final pwd = Directory.current.path;
  final manager = CleanManager(pwd: pwd);

  await manager.run(
    deep: result.flag('deep'),
    quick: result.flag('quick'),
    verbose: result.flag('verbose'),
  );
}
