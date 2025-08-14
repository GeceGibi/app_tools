// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Versioning {

@JsonKey(name: 'export-env-name') String get envName; VersioningFormat get formats;
/// Create a copy of Versioning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersioningCopyWith<Versioning> get copyWith => _$VersioningCopyWithImpl<Versioning>(this as Versioning, _$identity);

  /// Serializes this Versioning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Versioning&&(identical(other.envName, envName) || other.envName == envName)&&(identical(other.formats, formats) || other.formats == formats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,envName,formats);

@override
String toString() {
  return 'Versioning(envName: $envName, formats: $formats)';
}


}

/// @nodoc
abstract mixin class $VersioningCopyWith<$Res>  {
  factory $VersioningCopyWith(Versioning value, $Res Function(Versioning) _then) = _$VersioningCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'export-env-name') String envName, VersioningFormat formats
});


$VersioningFormatCopyWith<$Res> get formats;

}
/// @nodoc
class _$VersioningCopyWithImpl<$Res>
    implements $VersioningCopyWith<$Res> {
  _$VersioningCopyWithImpl(this._self, this._then);

  final Versioning _self;
  final $Res Function(Versioning) _then;

/// Create a copy of Versioning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? envName = null,Object? formats = null,}) {
  return _then(_self.copyWith(
envName: null == envName ? _self.envName : envName // ignore: cast_nullable_to_non_nullable
as String,formats: null == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as VersioningFormat,
  ));
}
/// Create a copy of Versioning
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersioningFormatCopyWith<$Res> get formats {
  
  return $VersioningFormatCopyWith<$Res>(_self.formats, (value) {
    return _then(_self.copyWith(formats: value));
  });
}
}


/// Adds pattern-matching-related methods to [Versioning].
extension VersioningPatterns on Versioning {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Versioning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Versioning() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Versioning value)  $default,){
final _that = this;
switch (_that) {
case _Versioning():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Versioning value)?  $default,){
final _that = this;
switch (_that) {
case _Versioning() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'export-env-name')  String envName,  VersioningFormat formats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Versioning() when $default != null:
return $default(_that.envName,_that.formats);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'export-env-name')  String envName,  VersioningFormat formats)  $default,) {final _that = this;
switch (_that) {
case _Versioning():
return $default(_that.envName,_that.formats);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'export-env-name')  String envName,  VersioningFormat formats)?  $default,) {final _that = this;
switch (_that) {
case _Versioning() when $default != null:
return $default(_that.envName,_that.formats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Versioning implements Versioning {
  const _Versioning({@JsonKey(name: 'export-env-name') this.envName = 'VERSION_TAG', this.formats = const VersioningFormat()});
  factory _Versioning.fromJson(Map<String, dynamic> json) => _$VersioningFromJson(json);

@override@JsonKey(name: 'export-env-name') final  String envName;
@override@JsonKey() final  VersioningFormat formats;

/// Create a copy of Versioning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersioningCopyWith<_Versioning> get copyWith => __$VersioningCopyWithImpl<_Versioning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersioningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Versioning&&(identical(other.envName, envName) || other.envName == envName)&&(identical(other.formats, formats) || other.formats == formats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,envName,formats);

@override
String toString() {
  return 'Versioning(envName: $envName, formats: $formats)';
}


}

/// @nodoc
abstract mixin class _$VersioningCopyWith<$Res> implements $VersioningCopyWith<$Res> {
  factory _$VersioningCopyWith(_Versioning value, $Res Function(_Versioning) _then) = __$VersioningCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'export-env-name') String envName, VersioningFormat formats
});


@override $VersioningFormatCopyWith<$Res> get formats;

}
/// @nodoc
class __$VersioningCopyWithImpl<$Res>
    implements _$VersioningCopyWith<$Res> {
  __$VersioningCopyWithImpl(this._self, this._then);

  final _Versioning _self;
  final $Res Function(_Versioning) _then;

/// Create a copy of Versioning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? envName = null,Object? formats = null,}) {
  return _then(_Versioning(
envName: null == envName ? _self.envName : envName // ignore: cast_nullable_to_non_nullable
as String,formats: null == formats ? _self.formats : formats // ignore: cast_nullable_to_non_nullable
as VersioningFormat,
  ));
}

/// Create a copy of Versioning
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersioningFormatCopyWith<$Res> get formats {
  
  return $VersioningFormatCopyWith<$Res>(_self.formats, (value) {
    return _then(_self.copyWith(formats: value));
  });
}
}


/// @nodoc
mixin _$VersioningFormat {

 String get tag;/// version-name:
///   - any: d.dd.dd
///   - ios: d.dd.dd
///   - android: d.dd.dd
///   - custom: d.dd.d
@JsonKey(name: 'version-name') List<Map<String, String>> get versionName;/// version-code:
///   - any: 1yyMMddHH
///   - ios: 1yyMMdd
///   - android: 1yyMMddHH
///   - custom: 1yyMMddHH
@JsonKey(name: 'version-code') List<Map<String, String>> get versionCode;
/// Create a copy of VersioningFormat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersioningFormatCopyWith<VersioningFormat> get copyWith => _$VersioningFormatCopyWithImpl<VersioningFormat>(this as VersioningFormat, _$identity);

  /// Serializes this VersioningFormat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersioningFormat&&(identical(other.tag, tag) || other.tag == tag)&&const DeepCollectionEquality().equals(other.versionName, versionName)&&const DeepCollectionEquality().equals(other.versionCode, versionCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tag,const DeepCollectionEquality().hash(versionName),const DeepCollectionEquality().hash(versionCode));

@override
String toString() {
  return 'VersioningFormat(tag: $tag, versionName: $versionName, versionCode: $versionCode)';
}


}

/// @nodoc
abstract mixin class $VersioningFormatCopyWith<$Res>  {
  factory $VersioningFormatCopyWith(VersioningFormat value, $Res Function(VersioningFormat) _then) = _$VersioningFormatCopyWithImpl;
@useResult
$Res call({
 String tag,@JsonKey(name: 'version-name') List<Map<String, String>> versionName,@JsonKey(name: 'version-code') List<Map<String, String>> versionCode
});




}
/// @nodoc
class _$VersioningFormatCopyWithImpl<$Res>
    implements $VersioningFormatCopyWith<$Res> {
  _$VersioningFormatCopyWithImpl(this._self, this._then);

  final VersioningFormat _self;
  final $Res Function(VersioningFormat) _then;

/// Create a copy of VersioningFormat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tag = null,Object? versionName = null,Object? versionCode = null,}) {
  return _then(_self.copyWith(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [VersioningFormat].
extension VersioningFormatPatterns on VersioningFormat {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersioningFormat value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersioningFormat() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersioningFormat value)  $default,){
final _that = this;
switch (_that) {
case _VersioningFormat():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersioningFormat value)?  $default,){
final _that = this;
switch (_that) {
case _VersioningFormat() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tag, @JsonKey(name: 'version-name')  List<Map<String, String>> versionName, @JsonKey(name: 'version-code')  List<Map<String, String>> versionCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VersioningFormat() when $default != null:
return $default(_that.tag,_that.versionName,_that.versionCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tag, @JsonKey(name: 'version-name')  List<Map<String, String>> versionName, @JsonKey(name: 'version-code')  List<Map<String, String>> versionCode)  $default,) {final _that = this;
switch (_that) {
case _VersioningFormat():
return $default(_that.tag,_that.versionName,_that.versionCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tag, @JsonKey(name: 'version-name')  List<Map<String, String>> versionName, @JsonKey(name: 'version-code')  List<Map<String, String>> versionCode)?  $default,) {final _that = this;
switch (_that) {
case _VersioningFormat() when $default != null:
return $default(_that.tag,_that.versionName,_that.versionCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VersioningFormat implements VersioningFormat {
  const _VersioningFormat({this.tag = 'v{versionName}-{platform}-{stage}-{flavor}-{versionCode}', @JsonKey(name: 'version-name') final  List<Map<String, String>> versionName = const [], @JsonKey(name: 'version-code') final  List<Map<String, String>> versionCode = const []}): _versionName = versionName,_versionCode = versionCode;
  factory _VersioningFormat.fromJson(Map<String, dynamic> json) => _$VersioningFormatFromJson(json);

@override@JsonKey() final  String tag;
/// version-name:
///   - any: d.dd.dd
///   - ios: d.dd.dd
///   - android: d.dd.dd
///   - custom: d.dd.d
 final  List<Map<String, String>> _versionName;
/// version-name:
///   - any: d.dd.dd
///   - ios: d.dd.dd
///   - android: d.dd.dd
///   - custom: d.dd.d
@override@JsonKey(name: 'version-name') List<Map<String, String>> get versionName {
  if (_versionName is EqualUnmodifiableListView) return _versionName;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_versionName);
}

/// version-code:
///   - any: 1yyMMddHH
///   - ios: 1yyMMdd
///   - android: 1yyMMddHH
///   - custom: 1yyMMddHH
 final  List<Map<String, String>> _versionCode;
/// version-code:
///   - any: 1yyMMddHH
///   - ios: 1yyMMdd
///   - android: 1yyMMddHH
///   - custom: 1yyMMddHH
@override@JsonKey(name: 'version-code') List<Map<String, String>> get versionCode {
  if (_versionCode is EqualUnmodifiableListView) return _versionCode;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_versionCode);
}


/// Create a copy of VersioningFormat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersioningFormatCopyWith<_VersioningFormat> get copyWith => __$VersioningFormatCopyWithImpl<_VersioningFormat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersioningFormatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersioningFormat&&(identical(other.tag, tag) || other.tag == tag)&&const DeepCollectionEquality().equals(other._versionName, _versionName)&&const DeepCollectionEquality().equals(other._versionCode, _versionCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tag,const DeepCollectionEquality().hash(_versionName),const DeepCollectionEquality().hash(_versionCode));

@override
String toString() {
  return 'VersioningFormat(tag: $tag, versionName: $versionName, versionCode: $versionCode)';
}


}

/// @nodoc
abstract mixin class _$VersioningFormatCopyWith<$Res> implements $VersioningFormatCopyWith<$Res> {
  factory _$VersioningFormatCopyWith(_VersioningFormat value, $Res Function(_VersioningFormat) _then) = __$VersioningFormatCopyWithImpl;
@override @useResult
$Res call({
 String tag,@JsonKey(name: 'version-name') List<Map<String, String>> versionName,@JsonKey(name: 'version-code') List<Map<String, String>> versionCode
});




}
/// @nodoc
class __$VersioningFormatCopyWithImpl<$Res>
    implements _$VersioningFormatCopyWith<$Res> {
  __$VersioningFormatCopyWithImpl(this._self, this._then);

  final _VersioningFormat _self;
  final $Res Function(_VersioningFormat) _then;

/// Create a copy of VersioningFormat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tag = null,Object? versionName = null,Object? versionCode = null,}) {
  return _then(_VersioningFormat(
tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self._versionName : versionName // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,versionCode: null == versionCode ? _self._versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
