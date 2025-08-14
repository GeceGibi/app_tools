// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  version: json['version'] as String? ?? '0.0.1+0',
  format: json['format'] as String? ?? '#.#.#+1yyMMdd',
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'version': instance.version,
  'format': instance.format,
};
