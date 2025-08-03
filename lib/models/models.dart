import 'package:freezed_annotation/freezed_annotation.dart';

export 'version.dart';


class FormatParser extends JsonConverter<String, Object?> {
  const FormatParser();

  @override
  Object? toJson(Object? object) => object;

  @override
  String fromJson(Object? json) => json.toString();
}
