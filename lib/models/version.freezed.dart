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

 String get package; String get versionName; int get versionCode; String get versionCodeFormat;/// Build Arguments
@JsonKey(includeIfNull: false) List<String>? get buildArguments;/// Build Before-After Commands
@JsonKey(includeIfNull: false) String? get runAfter;@JsonKey(includeIfNull: false) String? get runAfterPwd;@JsonKey(includeIfNull: false) String? get runBefore;@JsonKey(includeIfNull: false) String? get runBeforePwd;
/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionCopyWith<Version> get copyWith => _$VersionCopyWithImpl<Version>(this as Version, _$identity);

  /// Serializes this Version to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Version&&(identical(other.package, package) || other.package == package)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.versionCodeFormat, versionCodeFormat) || other.versionCodeFormat == versionCodeFormat)&&const DeepCollectionEquality().equals(other.buildArguments, buildArguments)&&(identical(other.runAfter, runAfter) || other.runAfter == runAfter)&&(identical(other.runAfterPwd, runAfterPwd) || other.runAfterPwd == runAfterPwd)&&(identical(other.runBefore, runBefore) || other.runBefore == runBefore)&&(identical(other.runBeforePwd, runBeforePwd) || other.runBeforePwd == runBeforePwd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,versionName,versionCode,versionCodeFormat,const DeepCollectionEquality().hash(buildArguments),runAfter,runAfterPwd,runBefore,runBeforePwd);

@override
String toString() {
  return 'Version(package: $package, versionName: $versionName, versionCode: $versionCode, versionCodeFormat: $versionCodeFormat, buildArguments: $buildArguments, runAfter: $runAfter, runAfterPwd: $runAfterPwd, runBefore: $runBefore, runBeforePwd: $runBeforePwd)';
}


}

/// @nodoc
abstract mixin class $VersionCopyWith<$Res>  {
  factory $VersionCopyWith(Version value, $Res Function(Version) _then) = _$VersionCopyWithImpl;
@useResult
$Res call({
 String package, String versionName, int versionCode, String versionCodeFormat,@JsonKey(includeIfNull: false) List<String>? buildArguments,@JsonKey(includeIfNull: false) String? runAfter,@JsonKey(includeIfNull: false) String? runAfterPwd,@JsonKey(includeIfNull: false) String? runBefore,@JsonKey(includeIfNull: false) String? runBeforePwd
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
@pragma('vm:prefer-inline') @override $Res call({Object? package = null,Object? versionName = null,Object? versionCode = null,Object? versionCodeFormat = null,Object? buildArguments = freezed,Object? runAfter = freezed,Object? runAfterPwd = freezed,Object? runBefore = freezed,Object? runBeforePwd = freezed,}) {
  return _then(_self.copyWith(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,versionCodeFormat: null == versionCodeFormat ? _self.versionCodeFormat : versionCodeFormat // ignore: cast_nullable_to_non_nullable
as String,buildArguments: freezed == buildArguments ? _self.buildArguments : buildArguments // ignore: cast_nullable_to_non_nullable
as List<String>?,runAfter: freezed == runAfter ? _self.runAfter : runAfter // ignore: cast_nullable_to_non_nullable
as String?,runAfterPwd: freezed == runAfterPwd ? _self.runAfterPwd : runAfterPwd // ignore: cast_nullable_to_non_nullable
as String?,runBefore: freezed == runBefore ? _self.runBefore : runBefore // ignore: cast_nullable_to_non_nullable
as String?,runBeforePwd: freezed == runBeforePwd ? _self.runBeforePwd : runBeforePwd // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String package,  String versionName,  int versionCode,  String versionCodeFormat, @JsonKey(includeIfNull: false)  List<String>? buildArguments, @JsonKey(includeIfNull: false)  String? runAfter, @JsonKey(includeIfNull: false)  String? runAfterPwd, @JsonKey(includeIfNull: false)  String? runBefore, @JsonKey(includeIfNull: false)  String? runBeforePwd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.package,_that.versionName,_that.versionCode,_that.versionCodeFormat,_that.buildArguments,_that.runAfter,_that.runAfterPwd,_that.runBefore,_that.runBeforePwd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String package,  String versionName,  int versionCode,  String versionCodeFormat, @JsonKey(includeIfNull: false)  List<String>? buildArguments, @JsonKey(includeIfNull: false)  String? runAfter, @JsonKey(includeIfNull: false)  String? runAfterPwd, @JsonKey(includeIfNull: false)  String? runBefore, @JsonKey(includeIfNull: false)  String? runBeforePwd)  $default,) {final _that = this;
switch (_that) {
case _Version():
return $default(_that.package,_that.versionName,_that.versionCode,_that.versionCodeFormat,_that.buildArguments,_that.runAfter,_that.runAfterPwd,_that.runBefore,_that.runBeforePwd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String package,  String versionName,  int versionCode,  String versionCodeFormat, @JsonKey(includeIfNull: false)  List<String>? buildArguments, @JsonKey(includeIfNull: false)  String? runAfter, @JsonKey(includeIfNull: false)  String? runAfterPwd, @JsonKey(includeIfNull: false)  String? runBefore, @JsonKey(includeIfNull: false)  String? runBeforePwd)?  $default,) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.package,_that.versionName,_that.versionCode,_that.versionCodeFormat,_that.buildArguments,_that.runAfter,_that.runAfterPwd,_that.runBefore,_that.runBeforePwd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Version extends Version {
  const _Version({required this.package, this.versionName = '0.0.1', this.versionCode = 0, this.versionCodeFormat = '1yyMMdd+', @JsonKey(includeIfNull: false) final  List<String>? buildArguments, @JsonKey(includeIfNull: false) this.runAfter, @JsonKey(includeIfNull: false) this.runAfterPwd, @JsonKey(includeIfNull: false) this.runBefore, @JsonKey(includeIfNull: false) this.runBeforePwd}): _buildArguments = buildArguments,super._();
  factory _Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

@override final  String package;
@override@JsonKey() final  String versionName;
@override@JsonKey() final  int versionCode;
@override@JsonKey() final  String versionCodeFormat;
/// Build Arguments
 final  List<String>? _buildArguments;
/// Build Arguments
@override@JsonKey(includeIfNull: false) List<String>? get buildArguments {
  final value = _buildArguments;
  if (value == null) return null;
  if (_buildArguments is EqualUnmodifiableListView) return _buildArguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

/// Build Before-After Commands
@override@JsonKey(includeIfNull: false) final  String? runAfter;
@override@JsonKey(includeIfNull: false) final  String? runAfterPwd;
@override@JsonKey(includeIfNull: false) final  String? runBefore;
@override@JsonKey(includeIfNull: false) final  String? runBeforePwd;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Version&&(identical(other.package, package) || other.package == package)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.versionCode, versionCode) || other.versionCode == versionCode)&&(identical(other.versionCodeFormat, versionCodeFormat) || other.versionCodeFormat == versionCodeFormat)&&const DeepCollectionEquality().equals(other._buildArguments, _buildArguments)&&(identical(other.runAfter, runAfter) || other.runAfter == runAfter)&&(identical(other.runAfterPwd, runAfterPwd) || other.runAfterPwd == runAfterPwd)&&(identical(other.runBefore, runBefore) || other.runBefore == runBefore)&&(identical(other.runBeforePwd, runBeforePwd) || other.runBeforePwd == runBeforePwd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,versionName,versionCode,versionCodeFormat,const DeepCollectionEquality().hash(_buildArguments),runAfter,runAfterPwd,runBefore,runBeforePwd);

@override
String toString() {
  return 'Version(package: $package, versionName: $versionName, versionCode: $versionCode, versionCodeFormat: $versionCodeFormat, buildArguments: $buildArguments, runAfter: $runAfter, runAfterPwd: $runAfterPwd, runBefore: $runBefore, runBeforePwd: $runBeforePwd)';
}


}

/// @nodoc
abstract mixin class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) _then) = __$VersionCopyWithImpl;
@override @useResult
$Res call({
 String package, String versionName, int versionCode, String versionCodeFormat,@JsonKey(includeIfNull: false) List<String>? buildArguments,@JsonKey(includeIfNull: false) String? runAfter,@JsonKey(includeIfNull: false) String? runAfterPwd,@JsonKey(includeIfNull: false) String? runBefore,@JsonKey(includeIfNull: false) String? runBeforePwd
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
@override @pragma('vm:prefer-inline') $Res call({Object? package = null,Object? versionName = null,Object? versionCode = null,Object? versionCodeFormat = null,Object? buildArguments = freezed,Object? runAfter = freezed,Object? runAfterPwd = freezed,Object? runBefore = freezed,Object? runBeforePwd = freezed,}) {
  return _then(_Version(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,versionCode: null == versionCode ? _self.versionCode : versionCode // ignore: cast_nullable_to_non_nullable
as int,versionCodeFormat: null == versionCodeFormat ? _self.versionCodeFormat : versionCodeFormat // ignore: cast_nullable_to_non_nullable
as String,buildArguments: freezed == buildArguments ? _self._buildArguments : buildArguments // ignore: cast_nullable_to_non_nullable
as List<String>?,runAfter: freezed == runAfter ? _self.runAfter : runAfter // ignore: cast_nullable_to_non_nullable
as String?,runAfterPwd: freezed == runAfterPwd ? _self.runAfterPwd : runAfterPwd // ignore: cast_nullable_to_non_nullable
as String?,runBefore: freezed == runBefore ? _self.runBefore : runBefore // ignore: cast_nullable_to_non_nullable
as String?,runBeforePwd: freezed == runBeforePwd ? _self.runBeforePwd : runBeforePwd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
