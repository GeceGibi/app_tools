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

  static String replaceTemplate(String template) {
    final variables = {
      ...Platform.environment,
      'CWD': Directory.current.path,
    };

    return template.replaceAllMapped(
      RegExp(r'\{(\w+)\}'),
      (match) {
        final key = match.group(1);
        return variables[key]?.toString() ?? match.group(0)!;
      },
    );
  }

  Future<int> run({bool verbose = false}) async {
    Printer.warning('┌⏺ $description');
    Printer.info('├❯ Running: $command ${arguments.join(" ")}');

    if (pwd != null) {
      Printer.info('├❯ Working Directory: $pwd');
    }

    final process =
        await Process.start(
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

    return exitCode;
  }
}
