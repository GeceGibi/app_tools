import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
class Version with _$Version {
  const factory Version({
    required String platform,
    required bool uploaded,
    @JsonKey(name: 'build_name') required String buildName,
    @JsonKey(name: 'build_number') required int buildNumber,
    @JsonKey(name: 'build_number_pattern') String? buildNumberPattern,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}
