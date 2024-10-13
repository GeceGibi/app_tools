// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VersionImpl _$$VersionImplFromJson(Map<String, dynamic> json) =>
    _$VersionImpl(
      buildName: json['build_name'] as String,
      buildNumber: (json['build_number'] as num).toInt(),
      buildNumberPattern: json['build_number_pattern'] as String?,
    );

Map<String, dynamic> _$$VersionImplToJson(_$VersionImpl instance) =>
    <String, dynamic>{
      'build_name': instance.buildName,
      'build_number': instance.buildNumber,
      'build_number_pattern': instance.buildNumberPattern,
    };
