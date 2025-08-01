// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  package: json['package'] as String,
  versionName: json['versionName'] as String? ?? '0.0.1',
  versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
  versionCodeFormat: json['versionCodeFormat'] as String? ?? '1yyMMdd+',
  arguments: (json['arguments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  buildAfterCommand: (json['buildAfterCommand'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  buildBeforeCommand: (json['buildBeforeCommand'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'package': instance.package,
  'versionName': instance.versionName,
  'versionCode': instance.versionCode,
  'versionCodeFormat': instance.versionCodeFormat,
  'arguments': ?instance.arguments,
  'buildAfterCommand': ?instance.buildAfterCommand,
  'buildBeforeCommand': ?instance.buildBeforeCommand,
};
