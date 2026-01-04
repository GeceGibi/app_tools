import 'dart:convert';
import 'dart:io';

import 'package:app_tools/printer.dart';

class Work {
  const Work({
    required this.description,
    required this.command,
    this.pwd,
  });

  final String description;
  final String command;
  final String? pwd;

  static String replaceTemplate(
    String template, {
    Map<String, dynamic> variables = const {},
  }) {
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
    Printer.info('├❯ Running: $command');

    if (pwd != null) {
      Printer.info('├❯ Working Directory: $pwd');
    }

    final stopwatch = Stopwatch()..start();

    final process = await Process.start(
      'sh',
      ['-c', command],
      workingDirectory: pwd,
      runInShell: true,
    );

    // Stdout/Stderr handling with proper utf8 transformation
    process.stderr.transform(utf8.decoder).listen((text) {
      final trimmed = text.trim();
      if (trimmed.isEmpty) return;
      Printer.write(trimmed);
    });

    process.stdout.transform(utf8.decoder).listen((text) {
      if (!verbose) return;
      final trimmed = text.trim();
      if (trimmed.isEmpty) return;
      Printer.write(trimmed);
    });

    final exitCode = await process.exitCode;
    stopwatch.stop();
    final elapsed = (stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(1);

    if (exitCode == 0) {
      Printer.success('└❯ Done (${elapsed}s), exitCode($exitCode)');
    } else {
      Printer.error('└❯ Failed (${elapsed}s), exitCode($exitCode)');
    }

    return exitCode;
  }
}
