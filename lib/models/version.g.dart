// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlatformEntry _$PlatformEntryFromJson(Map<String, dynamic> json) =>
    _PlatformEntry(
      build: Build.fromJson(json['build'] as Map<String, dynamic>),
      version: json['version'] == null
          ? const Version()
          : Version.fromJson(json['version'] as Map<String, dynamic>),
      run: json['run'] == null
          ? null
          : Run.fromJson(json['run'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformEntryToJson(_PlatformEntry instance) =>
    <String, dynamic>{
      'build': instance.build.toJson(),
      'version': instance.version.toJson(),
      'run': ?instance.run?.toJson(),
    };

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  value: json['value'] as String? ?? '0.0.1+0',
  format: json['format'] == null
      ? '1yyMMdd'
      : const FormatParser().fromJson(json['format']),
  autoIncrement: json['autoIncrement'] as bool? ?? false,
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'value': instance.value,
  'format': const FormatParser().toJson(instance.format),
  'autoIncrement': instance.autoIncrement,
};

_Build _$BuildFromJson(Map<String, dynamic> json) => _Build(
  package: json['package'] as String,
  arguments: (json['arguments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$BuildToJson(_Build instance) => <String, dynamic>{
  'package': instance.package,
  'arguments': ?instance.arguments,
};

_Run _$RunFromJson(Map<String, dynamic> json) => _Run(
  after: Runner.fromJson(json['after'] as Map<String, dynamic>),
  before: Runner.fromJson(json['before'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RunToJson(_Run instance) => <String, dynamic>{
  'after': instance.after.toJson(),
  'before': instance.before.toJson(),
};

_Runner _$RunnerFromJson(Map<String, dynamic> json) => _Runner(
  commands: (json['commands'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  pwd: json['pwd'] as String?,
);

Map<String, dynamic> _$RunnerToJson(_Runner instance) => <String, dynamic>{
  'commands': instance.commands,
  'pwd': instance.pwd,
};
