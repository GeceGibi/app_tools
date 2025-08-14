// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Versioning _$VersioningFromJson(Map<String, dynamic> json) => _Versioning(
  envName: json['export-env-name'] as String? ?? 'VERSION_TAG',
  formats: json['formats'] == null
      ? const VersioningFormat()
      : VersioningFormat.fromJson(json['formats'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VersioningToJson(_Versioning instance) =>
    <String, dynamic>{
      'export-env-name': instance.envName,
      'formats': instance.formats.toJson(),
    };

_VersioningFormat _$VersioningFormatFromJson(Map<String, dynamic> json) =>
    _VersioningFormat(
      tag:
          json['tag'] as String? ??
          'v{versionName}-{platform}-{stage}-{flavor}-{versionCode}',
      versionName:
          (json['version-name'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
      versionCode:
          (json['version-code'] as List<dynamic>?)
              ?.map((e) => Map<String, String>.from(e as Map))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$VersioningFormatToJson(_VersioningFormat instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'version-name': instance.versionName,
      'version-code': instance.versionCode,
    };
