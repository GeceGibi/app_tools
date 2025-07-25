// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Version _$VersionFromJson(Map<String, dynamic> json) => _Version(
  buildName: json['build_name'] as String,
  buildNumber: (json['build_number'] as num).toInt(),
  buildNumberPattern: json['build_number_pattern'] as String?,
);

Map<String, dynamic> _$VersionToJson(_Version instance) => <String, dynamic>{
  'build_name': instance.buildName,
  'build_number': instance.buildNumber,
  'build_number_pattern': instance.buildNumberPattern,
};
