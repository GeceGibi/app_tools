import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
abstract class Version with _$Version {
  const factory Version({
    required String package,
    @Default('0.0.1') String versionName,
    @Default(0) int versionCode,
    @Default('1yyMMdd+') String versionCodeFormat,

    /// Build Arguments
    @JsonKey(includeIfNull: false) List<String>? buildArguments,

    /// Build Before-After Commands
    @JsonKey(includeIfNull: false) List<String>? afterCommand,
    @JsonKey(includeIfNull: false) String? afterCommandPwd,
    @JsonKey(includeIfNull: false) List<String>? beforeCommand,
    @JsonKey(includeIfNull: false) String? beforeCommandPwd,
  }) = _Version;

  const Version._();

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}
