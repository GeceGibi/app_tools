import 'package:app_tools/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
abstract class PlatformEntry with _$PlatformEntry {
  const factory PlatformEntry({
    required Build build,

    /// Version
    @Default(Version()) Version version,

    /// Build Before-After Commands
    @JsonKey(includeIfNull: false) Run? run,
  }) = _PlatformEntry;

  const PlatformEntry._();

  factory PlatformEntry.fromJson(Map<String, dynamic> json) =>
      _$PlatformEntryFromJson(json);
}

@freezed
abstract class Version with _$Version {
  const factory Version({
    @Default('0.0.1+0') String value,
    @FormatParser() @Default('1yyMMdd') String format,
    @Default(false) bool autoIncrement,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  const Version._();

  String get name => value.split('+').first;
  int get code => int.parse(value.split('+').last);
}

@freezed
abstract class Build with _$Build {
  const factory Build({
    required String package,

    /// Build Arguments
    @JsonKey(includeIfNull: false) List<String>? arguments,
  }) = _Build;

  factory Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);
}

@freezed
abstract class Run with _$Run {
  const factory Run({required Runner after, required Runner before}) = _Run;
  factory Run.fromJson(Map<String, dynamic> json) => _$RunFromJson(json);
}

@freezed
abstract class Runner with _$Runner {
  const factory Runner({
    required List<String> commands,
    required String? pwd,
  }) = _Runner;

  factory Runner.fromJson(Map<String, dynamic> json) => _$RunnerFromJson(json);
}
