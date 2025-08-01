// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  versionName: json['versionName'] as String? ?? '0.0.1',
  versionCode: (json['versionCode'] as num?)?.toInt() ?? 0,
  versionCodeFormat: json['versionCodeFormat'] as String? ?? 'yymmdd+',
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'versionName': instance.versionName,
  'versionCode': instance.versionCode,
  'versionCodeFormat': instance.versionCodeFormat,
};
