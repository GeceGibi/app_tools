import 'package:freezed_annotation/freezed_annotation.dart';

part 'version.g.dart';
part 'version.freezed.dart';

@freezed
abstract class Version with _$Version {
  const factory Version({
    @Default('0.0.1+0') String version,
    @Default('#.#.#+1yyMMdd') String format,
  }) = _Version;

  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);

  const Version._();

  String get name => version.split('+').first;
  int get code => int.parse(version.split('+').last);

  String get formatName => format.split('+').first;
  String get formatCode => format.split('+').last;
}
