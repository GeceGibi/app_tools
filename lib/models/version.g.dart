// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  versionName: json['versionName'] as String? ?? '0.0.1',
  versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
  versionCodeFormat: json['versionCodeFormat'] as String? ?? 'yymmdd+',
  arguments:
      (json['arguments'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  package: json['package'] as String?,
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'versionName': instance.versionName,
  'versionCode': instance.versionCode,
  'versionCodeFormat': instance.versionCodeFormat,
  'arguments': instance.arguments,
  'package': instance.package,
};
