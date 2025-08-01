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
    @Default([]) List<String> arguments,
  }) = _Version;

  const Version._();

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}
