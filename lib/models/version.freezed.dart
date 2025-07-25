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

@JsonKey(name: 'build_name') String get buildName;@JsonKey(name: 'build_number') int get buildNumber;@JsonKey(name: 'build_number_pattern') String? get buildNumberPattern;
/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionCopyWith<Version> get copyWith => _$VersionCopyWithImpl<Version>(this as Version, _$identity);

  /// Serializes this Version to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Version&&(identical(other.buildName, buildName) || other.buildName == buildName)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.buildNumberPattern, buildNumberPattern) || other.buildNumberPattern == buildNumberPattern));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildName,buildNumber,buildNumberPattern);

@override
String toString() {
  return 'Version(buildName: $buildName, buildNumber: $buildNumber, buildNumberPattern: $buildNumberPattern)';
}


}

/// @nodoc
abstract mixin class $VersionCopyWith<$Res>  {
  factory $VersionCopyWith(Version value, $Res Function(Version) _then) = _$VersionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'build_name') String buildName,@JsonKey(name: 'build_number') int buildNumber,@JsonKey(name: 'build_number_pattern') String? buildNumberPattern
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
@pragma('vm:prefer-inline') @override $Res call({Object? buildName = null,Object? buildNumber = null,Object? buildNumberPattern = freezed,}) {
  return _then(_self.copyWith(
buildName: null == buildName ? _self.buildName : buildName // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int,buildNumberPattern: freezed == buildNumberPattern ? _self.buildNumberPattern : buildNumberPattern // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'build_name')  String buildName, @JsonKey(name: 'build_number')  int buildNumber, @JsonKey(name: 'build_number_pattern')  String? buildNumberPattern)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.buildName,_that.buildNumber,_that.buildNumberPattern);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'build_name')  String buildName, @JsonKey(name: 'build_number')  int buildNumber, @JsonKey(name: 'build_number_pattern')  String? buildNumberPattern)  $default,) {final _that = this;
switch (_that) {
case _Version():
return $default(_that.buildName,_that.buildNumber,_that.buildNumberPattern);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'build_name')  String buildName, @JsonKey(name: 'build_number')  int buildNumber, @JsonKey(name: 'build_number_pattern')  String? buildNumberPattern)?  $default,) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.buildName,_that.buildNumber,_that.buildNumberPattern);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Version extends Version {
  const _Version({@JsonKey(name: 'build_name') required this.buildName, @JsonKey(name: 'build_number') required this.buildNumber, @JsonKey(name: 'build_number_pattern') this.buildNumberPattern}): super._();
  factory _Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

@override@JsonKey(name: 'build_name') final  String buildName;
@override@JsonKey(name: 'build_number') final  int buildNumber;
@override@JsonKey(name: 'build_number_pattern') final  String? buildNumberPattern;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Version&&(identical(other.buildName, buildName) || other.buildName == buildName)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.buildNumberPattern, buildNumberPattern) || other.buildNumberPattern == buildNumberPattern));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buildName,buildNumber,buildNumberPattern);

@override
String toString() {
  return 'Version(buildName: $buildName, buildNumber: $buildNumber, buildNumberPattern: $buildNumberPattern)';
}


}

/// @nodoc
abstract mixin class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) _then) = __$VersionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'build_name') String buildName,@JsonKey(name: 'build_number') int buildNumber,@JsonKey(name: 'build_number_pattern') String? buildNumberPattern
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
@override @pragma('vm:prefer-inline') $Res call({Object? buildName = null,Object? buildNumber = null,Object? buildNumberPattern = freezed,}) {
  return _then(_Version(
buildName: null == buildName ? _self.buildName : buildName // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int,buildNumberPattern: freezed == buildNumberPattern ? _self.buildNumberPattern : buildNumberPattern // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
