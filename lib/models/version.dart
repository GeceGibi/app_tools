import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
class Version with _$Version {
  const factory Version({
    @JsonKey(name: 'build_name') required String buildName,
    @JsonKey(name: 'build_number') required int buildNumber,
    @JsonKey(name: 'build_number_pattern') String? buildNumberPattern,
  }) = _Version;

  const Version._();

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  String toEnvLine(String platform) {
    final pattern = buildNumberPattern != null ? '|$buildNumberPattern' : '';
    return '$platform=$buildName+$buildNumber$pattern';
  }
}
