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
mixin _$Version {

 String get versionName; int get versionCode; String get versionCodeFormat; List<String> get arguments;@JsonKey(includeIfNull: false) String? get package;
/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionCopyWith<Version> get copyWith => _$VersionCopyWithImpl<Version>(this as Version, _$identity);

  /// Serializes this Version to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Version&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.versionCodeFormat, versionCodeFormat) || other.versionCodeFormat == versionCodeFormat)&&const DeepCollectionEquality().equals(other.arguments, arguments)&&(identical(other.package, package) || other.package == package));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,versionName,versionCode,versionCodeFormat,const DeepCollectionEquality().hash(arguments),package);

@override
String toString() {
  return 'Version(versionName: $versionName, versionCode: $versionCode, versionCodeFormat: $versionCodeFormat, arguments: $arguments, package: $package)';
}


}

/// @nodoc
abstract mixin class $VersionCopyWith<$Res>  {
  factory $VersionCopyWith(Version value, $Res Function(Version) _then) = _$VersionCopyWithImpl;
@useResult
$Res call({
 String versionName, int versionCode, String versionCodeFormat, List<String> arguments,@JsonKey(includeIfNull: false) String? package
});




}
/// @nodoc
class _$VersionCopyWithImpl<$Res>
    implements $VersionCopyWith<$Res> {
  _$VersionCopyWithImpl(this._self, this._then);

  final Version _self;
  final $Res Function(Version) _then;

/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? versionName = null,Object? versionCode = null,Object? versionCodeFormat = null,Object? arguments = null,Object? package = freezed,}) {
  return _then(_self.copyWith(
versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,versionCodeFormat: null == versionCodeFormat ? _self.versionCodeFormat : versionCodeFormat // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as List<String>,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Version].
extension VersionPatterns on Version {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Version value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Version() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Version value)  $default,){
final _that = this;
switch (_that) {
case _Version():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Version value)?  $default,){
final _that = this;
switch (_that) {
case _Version() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String versionName,  int versionCode,  String versionCodeFormat,  List<String> arguments, @JsonKey(includeIfNull: false)  String? package)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.versionName,_that.versionCode,_that.versionCodeFormat,_that.arguments,_that.package);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String versionName,  int versionCode,  String versionCodeFormat,  List<String> arguments, @JsonKey(includeIfNull: false)  String? package)  $default,) {final _that = this;
switch (_that) {
case _Version():
return $default(_that.versionName,_that.versionCode,_that.versionCodeFormat,_that.arguments,_that.package);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String versionName,  int versionCode,  String versionCodeFormat,  List<String> arguments, @JsonKey(includeIfNull: false)  String? package)?  $default,) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.versionName,_that.versionCode,_that.versionCodeFormat,_that.arguments,_that.package);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Version extends Version {
  const _Version({this.versionName = '0.0.1', this.versionCode = 0, this.versionCodeFormat = 'yymmdd+', final  List<String> arguments = const [], @JsonKey(includeIfNull: false) this.package}): _arguments = arguments,super._();
  factory _Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

@override@JsonKey() final  String versionName;
@override@JsonKey() final  int versionCode;
@override@JsonKey() final  String versionCodeFormat;
 final  List<String> _arguments;
@override@JsonKey() List<String> get arguments {
  if (_arguments is EqualUnmodifiableListView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_arguments);
}

@override@JsonKey(includeIfNull: false) final  String? package;

/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionCopyWith<_Version> get copyWith => __$VersionCopyWithImpl<_Version>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Version&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.versionCodeFormat, versionCodeFormat) || other.versionCodeFormat == versionCodeFormat)&&const DeepCollectionEquality().equals(other._arguments, _arguments)&&(identical(other.package, package) || other.package == package));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,versionName,versionCode,versionCodeFormat,const DeepCollectionEquality().hash(_arguments),package);

@override
String toString() {
  return 'Version(versionName: $versionName, versionCode: $versionCode, versionCodeFormat: $versionCodeFormat, arguments: $arguments, package: $package)';
}


}

/// @nodoc
abstract mixin class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) _then) = __$VersionCopyWithImpl;
@override @useResult
$Res call({
 String versionName, int versionCode, String versionCodeFormat, List<String> arguments,@JsonKey(includeIfNull: false) String? package
});




}
/// @nodoc
class __$VersionCopyWithImpl<$Res>
    implements _$VersionCopyWith<$Res> {
  __$VersionCopyWithImpl(this._self, this._then);

  final _Version _self;
  final $Res Function(_Version) _then;

/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? versionName = null,Object? versionCode = null,Object? versionCodeFormat = null,Object? arguments = null,Object? package = freezed,}) {
  return _then(_Version(
versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,versionCodeFormat: null == versionCodeFormat ? _self.versionCodeFormat : versionCodeFormat // ignore: cast_nullable_to_non_nullable
as String,arguments: null == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as List<String>,package: freezed == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
