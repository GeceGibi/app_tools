import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
abstract class Versioning with _$Versioning {
  const factory Versioning({
    @JsonKey(name: 'export-env-name') @Default('VERSION_TAG')
    String envName,
    @Default(VersioningFormat()) VersioningFormat formats,
  }) = _Versioning;

  factory Versioning.fromJson(Map<String, dynamic> json) =>
      _$VersioningFromJson(json);
}

@freezed
abstract class VersioningFormat with _$VersioningFormat {
  const factory VersioningFormat({
    @Default('v{versionName}-{flavor}-{stage}-{platform}-{versionCode}')
    String tag,

    /// version-name:
    ///   - any: d.dd.dd
    ///   - ios: d.dd.dd
    ///   - android: d.dd.dd
    ///   - custom: d.dd.d
    @JsonKey(name: 'version-name')
    @Default([])
    List<Map<String, String>> versionName,

    /// version-code:
    ///   - any: 1yyMMddHH
    ///   - ios: 1yyMMdd
    ///   - android: 1yyMMddHH
    ///   - custom: 1yyMMddHH
    @JsonKey(name: 'version-code')
    @Default([])
    List<Map<String, String>> versionCode,
  }) = _VersioningFormat;

  factory VersioningFormat.fromJson(Map<String, dynamic> json) =>
      _$VersioningFormatFromJson(json);
}
