import 'dart:io';

import 'package:app_tools/app_tools.dart';
import 'package:args/args.dart';

Future<void> main(List<String> args) async {
  final parser = ArgParser()
    ..addFlag('clean', abbr: 'c', defaultsTo: true)
    ..addFlag('ios', abbr: 'i', defaultsTo: true)
    ..addFlag('freezed', abbr: 'f', defaultsTo: true)
    ..addFlag('l10n', abbr: 'n', defaultsTo: true) // n for l10n
    ..addFlag('lock-files', abbr: 'l')
    ..addFlag('help', abbr: 'h')
    ..addFlag('verbose', abbr: 'v');

  final result = parser.parse(args);

  if (result.flag('help')) {
    Printer.info(parser.usage);
    return;
  }

  final pwd = Directory.current.path;
  final manager = CleanManager(pwd: pwd);

  await manager.run(
    clean: result.flag('clean'),
    ios: result.flag('ios'),
    freezed: result.flag('freezed'),
    l10n: result.flag('l10n'),
    lockFiles: result.flag('lock-files'),
    verbose: result.flag('verbose'),
  );
}
