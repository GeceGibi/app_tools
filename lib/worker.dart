import 'dart:io';

import 'package:app_tools/printer.dart';

class Work {
  const Work({
    required this.description,
    required this.command,
    required this.arguments,
    this.pwd,
  });

  final String description;
  final String command;
  final String? pwd;
  final List<String> arguments;
}

class Worker {
  static Future<int> run(Work work, {bool verbose = false}) async {
    Printer.info('┌⏺ ${work.description}');
    Printer.success('├❯ ${work.command} ${work.arguments.join(" ")}');

    final process = await Process.run(
      work.command,
      work.arguments,
      workingDirectory: work.pwd,
    );

    if (verbose) {
      final out = (process.stdout as String).trim();

      if (out.isNotEmpty) {
        print(out.split('\n').map((line) => '├❯ $line').join('\n'));
      }
    }

    if (process.exitCode != 0) {
      Printer.error('└❯ exit(${process.exitCode}): ${process.stderr}');
    } else {
      Printer.success('└❯ exit(${process.exitCode})');
    }

    return process.exitCode;
  }
}
