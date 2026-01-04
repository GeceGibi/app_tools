import 'dart:io';

import 'package:app_tools/app_tools.dart';
import 'package:args/args.dart';

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

  final cwd = Directory.current.path;
  final manager = VersionManager(cwd: cwd);

  if (arguments.flag('init')) {
    manager.initVersionFile();
    return;
  }

  final config = manager.readConfigFile();
  final platform = arguments.option('platform')!;
  final stage = arguments.option('stage')!;
  final flavor = arguments.option('flavor');

  final foundedTag = await manager.getLatestTag(
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
    'flavor': flavor ?? '',
  };

  if (foundedTag.isNotEmpty) {
    payload = manager.parseTagByTemplate(config.formats.tag, foundedTag);
  }

  final versionCode = manager.generateVersionCode(
    config: config,
    platform: platform,
    currentVersionCode: int.parse(payload['versionCode']!),
    autoBump: arguments.flag('auto-bump-version-code'),
    patch: arguments.flag('patch'),
    minor: arguments.flag('minor'),
    major: arguments.flag('major'),
  );

  final versionName = manager.generateVersionName(
    config: config,
    platform: platform,
    currentVersionName: payload['versionName']!,
    patch: arguments.flag('patch'),
    minor: arguments.flag('minor'),
    major: arguments.flag('major'),
  );

  final newTag = manager.generateTag(config.formats.tag, (variable) {
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
    manager.exportEnv(
      config: config,
      tag: newTag,
      versionName: versionName,
      versionCode: '$versionCode',
    );
  }
}
