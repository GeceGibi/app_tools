import 'dart:convert';
import 'dart:io';

import 'package:app_tools/printer.dart';

class Work {
  const Work({
    required this.description,
    required this.command,
    required this.arguments,
    this.onComplete,
    this.pwd,
  });

  final String description;
  final String command;
  final String? pwd;
  final List<String> arguments;
  final void Function(int statusCode)? onComplete;

  Future<void> run({bool verbose = false}) async {
    Printer.info('┌⏺ $description');
    Printer.success('├❯ $command ${arguments.join(" ")}');

    final process = await Process.start(
      command,
      arguments,
      workingDirectory: pwd,
    )
      ..stderr.listen((e) => Printer.error(utf8.decode(e).trim()))
      ..stdout.listen((e) {
        if (!verbose) {
          return;
        }

        print(utf8.decode(e).trim());
      });

    final exitCode = await process.exitCode;

    if (exitCode != 0) {
      Printer.error('└❯ exit($exitCode)');
    } else {
      Printer.success('└❯ exit($exitCode)');
    }

    onComplete?.call(exitCode);
  }
}
