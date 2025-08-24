import 'dart:convert';
import 'dart:io';

import 'package:app_tools/models/models.dart';
import 'package:app_tools/printer.dart';
import 'package:args/args.dart';
import 'package:intl/intl.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

final String cwd = Directory.current.path;
final versioningFile = File('$cwd/versioning.yaml');

Map<String, String> parseTagByTemplate(String template, String tag) {
  final keyRe = RegExp(r'\{([^}]+)\}');
  final keys = keyRe.allMatches(template).map((m) => m.group(1)!).toList();

  if (tag.startsWith('v')) {
    tag = tag.replaceFirst('v', '');
  }

  final parts = tag.split('-');
  if (parts.length != keys.length) {
    throw ArgumentError('Tag format is not valid');
  }

  final out = <String, String>{};
  for (var i = 0; i < keys.length; i++) {
    out[keys[i]] = parts[i];
  }

  return out;
}

String generateTag(String format, String? Function(String variable) callback) {
  final regex = RegExp(r'\{([^}]+)\}');
  final matches = regex.allMatches(format).toList();

  for (final match in matches) {
    final variable = match.group(1)!;
    final replacement = callback(variable) ?? '';
    format = format.replaceFirst(match.group(0)!, replacement);
  }

  return format.replaceAll('--', '-');
}

String generateVersionName({
  required String versionName,
  required Versioning config,
  required String platform,
  bool patch = false,
  bool minor = false,
  bool major = false,
}) {
  if (!patch && !minor && !major) {
    return versionName;
  }

  var format = 'd.dd.dd';

  for (final entry in config.formats.versionName) {
    if (entry.containsKey(platform)) {
      format = entry[platform]!;
      break;
    }
  }

  final formatSegments = format.split('.');
  final nameSegments = versionName.split('.');

  if (formatSegments.length != nameSegments.length) {
    throw Exception('Version format is not valid');
  }

  /// Patch
  if (patch) {
    final newPatch = int.parse(nameSegments[2]) + 1;
    nameSegments[2] = newPatch.toString();

    if (newPatch.toString().length > formatSegments[2].length) {
      nameSegments[2] = '0';
      nameSegments[1] = (int.parse(nameSegments[1]) + 1).toString();
    }

    /// Minor
  } else if (minor) {
    final newMinor = int.parse(nameSegments[1]) + 1;
    nameSegments[1] = newMinor.toString();

    if (newMinor.toString().length > formatSegments[1].length) {
      nameSegments[1] = '0';
      nameSegments[0] = (int.parse(nameSegments[0]) + 1).toString();
    }
  }
  /// Major
  else if (major) {
    final newMajor = int.parse(nameSegments[0]) + 1;
    if (newMajor.toString().length <= formatSegments[0].length) {
      nameSegments[0] = newMajor.toString();
    }
  }

  return nameSegments.join('.');
}

int generateVersionCode({
  required Versioning config,
  required int versionCode,
  required String platform,
  bool autoBump = true,
}) {
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

  if (newVersionCode <= versionCode && autoBump) {
    newVersionCode = versionCode + 1;
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

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption('platform', abbr: 'p', help: 'Platform name', mandatory: true)
    ..addOption('stage', abbr: 's', help: 'Stage name', mandatory: true)
    ..addOption('flavor', abbr: 'f', help: 'Flavor name')
    ///
    ..addFlag(
      'auto-bump-version-code',
      help: 'Auto bump version code',
      defaultsTo: true,
    )
    ///
    ..addFlag('minor', help: 'Increment minor version')
    ..addFlag('major', help: 'Increment major version')
    ..addFlag('patch', help: 'Increment patch version')
    ///
    ..addFlag('dry-run', help: 'Dry run')
    ..addFlag('init', help: 'Initialize version file')
    ..addFlag('verbose')
    ..addFlag('help');

  final arguments = parser.parse(args);

  if (arguments.flag('help')) {
    Printer.write(parser.usage);
    return;
  }

  if (arguments.flag('init')) {
    initVersionFile();
    return;
  }

  final config = readConfigFile();
  final platform = arguments.option('platform')!;
  final stage = arguments.option('stage')!;
  final flavor = arguments.option('flavor');

  final foundedTag = await getLatestTag(
    config.formats.tag,
    platform,
    stage,
    flavor,
  );

  var payload = <String, String>{
    'versionName': '1.0.0',
    'versionCode': '1',
    'platform': platform,
    'stage': stage,
    'flavor': ?flavor,
  };

  if (foundedTag.isNotEmpty) {
    payload = parseTagByTemplate(config.formats.tag, foundedTag);
  }

  final versionCode = generateVersionCode(
    config: config,
    platform: platform,
    versionCode: int.parse(payload['versionCode']!),
    autoBump: arguments.flag('auto-bump-version-code'),
  );

  final versionName = generateVersionName(
    config: config,
    platform: platform,
    versionName: payload['versionName']!,
    patch: arguments.flag('patch'),
    minor: arguments.flag('minor'),
    major: arguments.flag('major'),
  );

  final newTag = generateTag(config.formats.tag, (variable) {
    return switch (variable) {
      'versionName' => versionName,
      'versionCode' => '$versionCode',
      _ => payload[variable],
    };
  });

  Printer.write('');
  Printer.info('*' * 60);
  Printer.info('Platform: $platform');
  Printer.info('Build Name: $versionName');
  Printer.info('Build Number: $versionCode');
  Printer.info('Working Directory: $cwd');
  Printer.info('Generated Tag: $newTag');
  Printer.info('*' * 60);
  Printer.write('');

  if (!arguments.flag('dry-run')) {
    exportEnv(
      config: config,
      tag: newTag,
      versionName: versionName,
      versionCode: '$versionCode',
    );
  }
}

Versioning readConfigFile() {
  if (!versioningFile.existsSync()) {
    initVersionFile();
  }

  final yamlFile = loadYaml(versioningFile.readAsStringSync()) as YamlMap;
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
        final parts = line.split('=');
        variables[parts.first] = parts.last;
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
