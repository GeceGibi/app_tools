// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  version: json['version'] as String? ?? '0.0.1+0',
  format: json['format'] == null
      ? '1yyMMdd'
      : const FormatParser().fromJson(json['format']),
  autoIncrement: json['autoIncrement'] as bool? ?? false,
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'version': instance.version,
  'format': const FormatParser().toJson(instance.format),
  'autoIncrement': instance.autoIncrement,
};
