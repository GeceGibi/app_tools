import 'dart:convert';
import 'dart:io';

import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:intl/intl.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

class VersionManager {
  VersionManager({required this.cwd});

  final String cwd;

  File get versioningFile => File('$cwd/versioning.yaml');

  Map<String, String> parseTagByTemplate(String template, String tag) {
    var processedTag = tag;
    final keyRe = RegExp(r'\{([^}]+)\}');
    final keys = keyRe.allMatches(template).map((m) => m.group(1)!).toList();

    if (processedTag.startsWith('v')) {
      processedTag = processedTag.replaceFirst('v', '');
    }

    final parts = processedTag.split('-');
    if (parts.length != keys.length) {
      throw ArgumentError('Tag format is not valid');
    }

    final out = <String, String>{};
    for (var i = 0; i < keys.length; i++) {
      out[keys[i]] = parts[i];
    }

    return out;
  }

  String generateTag(
    String format,
    String? Function(String variable) callback,
  ) {
    var processedFormat = format;
    final regex = RegExp(r'\{([^}]+)\}');
    final matches = regex.allMatches(processedFormat).toList();

    for (final match in matches) {
      final variable = match.group(1)!;
      final replacement = callback(variable) ?? '';
      processedFormat = processedFormat.replaceFirst(
        match.group(0)!,
        replacement,
      );
    }

    return processedFormat.replaceAll('--', '-');
  }

  String generateVersionName({
    required String currentVersionName,
    required Versioning config,
    required String platform,
    bool patch = false,
    bool minor = false,
    bool major = false,
  }) {
    if (!patch && !minor && !major) {
      return currentVersionName;
    }

    var format = 'd.dd.dd';

    for (final entry in config.formats.versionName) {
      if (entry.containsKey(platform)) {
        format = entry[platform]!;
        break;
      }
    }

    final formatSegments = format.split('.');
    final nameSegments = currentVersionName.split('.');

    if (formatSegments.length != nameSegments.length) {
      throw Exception('Version format is not valid');
    }

    if (patch) {
      final newPatch = int.parse(nameSegments[2]) + 1;
      nameSegments[2] = newPatch.toString();

      if (newPatch.toString().length > formatSegments[2].length) {
        nameSegments[2] = '0';
        nameSegments[1] = (int.parse(nameSegments[1]) + 1).toString();
      }
    } else if (minor) {
      final newMinor = int.parse(nameSegments[1]) + 1;
      nameSegments[1] = newMinor.toString();
      nameSegments[2] = '0';

      if (newMinor.toString().length > formatSegments[1].length) {
        nameSegments[1] = '0';
        nameSegments[0] = (int.parse(nameSegments[0]) + 1).toString();
      }
    } else if (major) {
      nameSegments[0] = (int.parse(nameSegments[0]) + 1).toString();
      nameSegments[1] = '0';
      nameSegments[2] = '0';
    }

    return nameSegments.join('.');
  }

  int generateVersionCode({
    required Versioning config,
    required int currentVersionCode,
    required String platform,
    bool autoBump = true,
    bool patch = false,
    bool minor = false,
    bool major = false,
  }) {
    var shouldBump = autoBump;
    if (patch || minor || major) {
      shouldBump = true;
    }

    var format = '1yyMMdd';

    for (final entry in config.formats.versionCode) {
      if (entry.containsKey(platform)) {
        format = entry[platform]!;
        break;
      }
    }

    final now = DateTime.now();
    final dateFormat = DateFormat(format);

    var newVersionCode = int.parse(dateFormat.format(now));

    if (newVersionCode <= currentVersionCode && shouldBump) {
      newVersionCode = currentVersionCode + 1;
    }

    return newVersionCode;
  }

  void initVersionFile() {
    final file = versioningFile..createSync(recursive: true);
    final yamlEditor = YamlEditor('')..update([], const Versioning().toJson());
    file.writeAsStringSync(yamlEditor.toString());
  }

  Future<String> getLatestTag(
    String tagFormat,
    String? platform,
    String? stage,
    String? flavor,
  ) async {
    final pattern = generateTag(tagFormat, (variable) {
      return switch (variable) {
        'stage' => stage,
        'flavor' => flavor,
        'platform' => platform,
        'versionName' => '*',
        'versionCode' => '*',
        _ => variable,
      };
    });

    Printer.info('search-tag: $pattern');

    final result = await Process.run('sh', [
      '-c',
      'git tag -l "$pattern" --sort=-version:refname | head -n 1',
    ]);

    final foundedTag = result.stdout.toString().trim();

    if (foundedTag.isEmpty) {
      Printer.warning('No tag found');
    } else {
      Printer.success('founded-tag: $foundedTag');
    }

    return foundedTag;
  }

  Versioning readConfigFile() {
    if (!versioningFile.existsSync()) {
      initVersionFile();
    }

    final yamlFile = loadYaml(versioningFile.readAsStringSync()) as YamlMap;
    // Keeping the conversion for now as requested to keeping it simple,
    // replacing it with manual parsing might be "bokunu çikarmak" currently.
    final configJson = jsonDecode(jsonEncode(yamlFile.value)) as Map;

    return Versioning.fromJson(configJson.cast());
  }

  void exportEnv({
    required Versioning config,
    required String tag,
    required String versionName,
    required String versionCode,
  }) {
    final envFile = File('$cwd/.env');
    final env = {
      config.envName: tag,
      'VERSION_NAME': versionName,
      'VERSION_CODE': versionCode,
    };

    final variables = <String, String>{};

    if (envFile.existsSync()) {
      final lines = envFile.readAsLinesSync();

      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];

        if (line.contains('=')) {
          final index = line.indexOf('=');
          final key = line.substring(0, index);
          final value = line.substring(index + 1);
          variables[key] = value;
        } else {
          variables['#$i'] = line;
        }
      }
    }

    for (final MapEntry(:key, :value) in env.entries) {
      variables[key] = value;
    }

    final content = variables.entries.map((e) {
      if (e.key.startsWith('#')) {
        return e.value;
      }
      return '${e.key}=${e.value}';
    });

    envFile.writeAsStringSync(content.join('\n'));
  }
}
