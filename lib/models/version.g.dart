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
  buildArguments: (json['buildArguments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  runAfter: json['runAfter'] as String?,
  runAfterPwd: json['runAfterPwd'] as String?,
  runBefore: json['runBefore'] as String?,
  runBeforePwd: json['runBeforePwd'] as String?,
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'package': instance.package,
  'versionName': instance.versionName,
  'versionCode': instance.versionCode,
  'versionCodeFormat': instance.versionCodeFormat,
  'buildArguments': ?instance.buildArguments,
  'runAfter': ?instance.runAfter,
  'runAfterPwd': ?instance.runAfterPwd,
  'runBefore': ?instance.runBefore,
  'runBeforePwd': ?instance.runBeforePwd,
};
