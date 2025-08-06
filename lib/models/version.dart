import 'package:app_tools/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
abstract class Version with _$Version {
  const factory Version({
    @Default('0.0.1+0') String version,
    @FormatParser() @Default('1yyMMdd') String format,
    @Default(false) bool autoIncrement,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  const Version._();

  String get name => version.split('+').first;
  int get code => int.parse(version.split('+').last);
}
