import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
abstract class Version with _$Version {
  const factory Version({
    @Default('0.0.1') String versionName,
    @Default(0) int versionCode,
    @Default('yymmdd+') String versionCodeFormat,
  }) = _Version;

  const Version._();

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}
