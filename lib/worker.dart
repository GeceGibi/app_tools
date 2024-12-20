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
    Printer.warning('┌⏺ $description');
    Printer.info('├❯ Running: $command ${arguments.join(" ")}');

    final process = await Process.start(
      command,
      arguments,
      workingDirectory: pwd,
    )
      ..stderr.listen((bytes) => Printer.error(utf8.decode(bytes).trim()))
      ..stdout.listen((bytes) {
        if (!verbose) {
          return;
        }

        Printer.write(utf8.decode(bytes).trim());
      });

    final exitCode = await process.exitCode;

    if (exitCode == 0) {
      Printer.success('└❯ Done, exitCode($exitCode)');
    } else {
      Printer.error('└❯ Failed, exitCode($exitCode)');
    }

    onComplete?.call(exitCode);
  }
}
