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
mixin _$PlatformEntry {

 Build get build;/// Version
 Version get version;/// Build Before-After Commands
@JsonKey(includeIfNull: false) Run? get run;
/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlatformEntryCopyWith<PlatformEntry> get copyWith => _$PlatformEntryCopyWithImpl<PlatformEntry>(this as PlatformEntry, _$identity);

  /// Serializes this PlatformEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlatformEntry&&(identical(other.build, build) || other.build == build)&&(identical(other.version, version) || other.version == version)&&(identical(other.run, run) || other.run == run));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,build,version,run);

@override
String toString() {
  return 'PlatformEntry(build: $build, version: $version, run: $run)';
}


}

/// @nodoc
abstract mixin class $PlatformEntryCopyWith<$Res>  {
  factory $PlatformEntryCopyWith(PlatformEntry value, $Res Function(PlatformEntry) _then) = _$PlatformEntryCopyWithImpl;
@useResult
$Res call({
 Build build, Version version,@JsonKey(includeIfNull: false) Run? run
});


$BuildCopyWith<$Res> get build;$VersionCopyWith<$Res> get version;$RunCopyWith<$Res>? get run;

}
/// @nodoc
class _$PlatformEntryCopyWithImpl<$Res>
    implements $PlatformEntryCopyWith<$Res> {
  _$PlatformEntryCopyWithImpl(this._self, this._then);

  final PlatformEntry _self;
  final $Res Function(PlatformEntry) _then;

/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? build = null,Object? version = null,Object? run = freezed,}) {
  return _then(_self.copyWith(
build: null == build ? _self.build : build // ignore: cast_nullable_to_non_nullable
as Build,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as Version,run: freezed == run ? _self.run : run // ignore: cast_nullable_to_non_nullable
as Run?,
  ));
}
/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildCopyWith<$Res> get build {
  
  return $BuildCopyWith<$Res>(_self.build, (value) {
    return _then(_self.copyWith(build: value));
  });
}/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionCopyWith<$Res> get version {
  
  return $VersionCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunCopyWith<$Res>? get run {
    if (_self.run == null) {
    return null;
  }

  return $RunCopyWith<$Res>(_self.run!, (value) {
    return _then(_self.copyWith(run: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlatformEntry].
extension PlatformEntryPatterns on PlatformEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlatformEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlatformEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlatformEntry value)  $default,){
final _that = this;
switch (_that) {
case _PlatformEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlatformEntry value)?  $default,){
final _that = this;
switch (_that) {
case _PlatformEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Build build,  Version version, @JsonKey(includeIfNull: false)  Run? run)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlatformEntry() when $default != null:
return $default(_that.build,_that.version,_that.run);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Build build,  Version version, @JsonKey(includeIfNull: false)  Run? run)  $default,) {final _that = this;
switch (_that) {
case _PlatformEntry():
return $default(_that.build,_that.version,_that.run);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Build build,  Version version, @JsonKey(includeIfNull: false)  Run? run)?  $default,) {final _that = this;
switch (_that) {
case _PlatformEntry() when $default != null:
return $default(_that.build,_that.version,_that.run);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlatformEntry extends PlatformEntry {
  const _PlatformEntry({required this.build, this.version = const Version(), @JsonKey(includeIfNull: false) this.run}): super._();
  factory _PlatformEntry.fromJson(Map<String, dynamic> json) => _$PlatformEntryFromJson(json);

@override final  Build build;
/// Version
@override@JsonKey() final  Version version;
/// Build Before-After Commands
@override@JsonKey(includeIfNull: false) final  Run? run;

/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlatformEntryCopyWith<_PlatformEntry> get copyWith => __$PlatformEntryCopyWithImpl<_PlatformEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlatformEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlatformEntry&&(identical(other.build, build) || other.build == build)&&(identical(other.version, version) || other.version == version)&&(identical(other.run, run) || other.run == run));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,build,version,run);

@override
String toString() {
  return 'PlatformEntry(build: $build, version: $version, run: $run)';
}


}

/// @nodoc
abstract mixin class _$PlatformEntryCopyWith<$Res> implements $PlatformEntryCopyWith<$Res> {
  factory _$PlatformEntryCopyWith(_PlatformEntry value, $Res Function(_PlatformEntry) _then) = __$PlatformEntryCopyWithImpl;
@override @useResult
$Res call({
 Build build, Version version,@JsonKey(includeIfNull: false) Run? run
});


@override $BuildCopyWith<$Res> get build;@override $VersionCopyWith<$Res> get version;@override $RunCopyWith<$Res>? get run;

}
/// @nodoc
class __$PlatformEntryCopyWithImpl<$Res>
    implements _$PlatformEntryCopyWith<$Res> {
  __$PlatformEntryCopyWithImpl(this._self, this._then);

  final _PlatformEntry _self;
  final $Res Function(_PlatformEntry) _then;

/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? build = null,Object? version = null,Object? run = freezed,}) {
  return _then(_PlatformEntry(
build: null == build ? _self.build : build // ignore: cast_nullable_to_non_nullable
as Build,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as Version,run: freezed == run ? _self.run : run // ignore: cast_nullable_to_non_nullable
as Run?,
  ));
}

/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuildCopyWith<$Res> get build {
  
  return $BuildCopyWith<$Res>(_self.build, (value) {
    return _then(_self.copyWith(build: value));
  });
}/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VersionCopyWith<$Res> get version {
  
  return $VersionCopyWith<$Res>(_self.version, (value) {
    return _then(_self.copyWith(version: value));
  });
}/// Create a copy of PlatformEntry
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunCopyWith<$Res>? get run {
    if (_self.run == null) {
    return null;
  }

  return $RunCopyWith<$Res>(_self.run!, (value) {
    return _then(_self.copyWith(run: value));
  });
}
}


/// @nodoc
mixin _$Version {

 String get value;@FormatParser() String get format; bool get autoIncrement;
/// Create a copy of Version
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionCopyWith<Version> get copyWith => _$VersionCopyWithImpl<Version>(this as Version, _$identity);

  /// Serializes this Version to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Version&&(identical(other.value, value) || other.value == value)&&(identical(other.format, format) || other.format == format)&&(identical(other.autoIncrement, autoIncrement) || other.autoIncrement == autoIncrement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,format,autoIncrement);

@override
String toString() {
  return 'Version(value: $value, format: $format, autoIncrement: $autoIncrement)';
}


}

/// @nodoc
abstract mixin class $VersionCopyWith<$Res>  {
  factory $VersionCopyWith(Version value, $Res Function(Version) _then) = _$VersionCopyWithImpl;
@useResult
$Res call({
 String value,@FormatParser() String format, bool autoIncrement
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
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? format = null,Object? autoIncrement = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,autoIncrement: null == autoIncrement ? _self.autoIncrement : autoIncrement // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value, @FormatParser()  String format,  bool autoIncrement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.value,_that.format,_that.autoIncrement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value, @FormatParser()  String format,  bool autoIncrement)  $default,) {final _that = this;
switch (_that) {
case _Version():
return $default(_that.value,_that.format,_that.autoIncrement);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value, @FormatParser()  String format,  bool autoIncrement)?  $default,) {final _that = this;
switch (_that) {
case _Version() when $default != null:
return $default(_that.value,_that.format,_that.autoIncrement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Version extends Version {
  const _Version({this.value = '0.0.1+0', @FormatParser() this.format = '1yyMMdd', this.autoIncrement = false}): super._();
  factory _Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);

@override@JsonKey() final  String value;
@override@JsonKey()@FormatParser() final  String format;
@override@JsonKey() final  bool autoIncrement;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Version&&(identical(other.value, value) || other.value == value)&&(identical(other.format, format) || other.format == format)&&(identical(other.autoIncrement, autoIncrement) || other.autoIncrement == autoIncrement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,format,autoIncrement);

@override
String toString() {
  return 'Version(value: $value, format: $format, autoIncrement: $autoIncrement)';
}


}

/// @nodoc
abstract mixin class _$VersionCopyWith<$Res> implements $VersionCopyWith<$Res> {
  factory _$VersionCopyWith(_Version value, $Res Function(_Version) _then) = __$VersionCopyWithImpl;
@override @useResult
$Res call({
 String value,@FormatParser() String format, bool autoIncrement
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
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? format = null,Object? autoIncrement = null,}) {
  return _then(_Version(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,format: null == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String,autoIncrement: null == autoIncrement ? _self.autoIncrement : autoIncrement // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$Build {

 String get package;/// Build Arguments
@JsonKey(includeIfNull: false) List<String>? get arguments;
/// Create a copy of Build
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuildCopyWith<Build> get copyWith => _$BuildCopyWithImpl<Build>(this as Build, _$identity);

  /// Serializes this Build to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Build&&(identical(other.package, package) || other.package == package)&&const DeepCollectionEquality().equals(other.arguments, arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,const DeepCollectionEquality().hash(arguments));

@override
String toString() {
  return 'Build(package: $package, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class $BuildCopyWith<$Res>  {
  factory $BuildCopyWith(Build value, $Res Function(Build) _then) = _$BuildCopyWithImpl;
@useResult
$Res call({
 String package,@JsonKey(includeIfNull: false) List<String>? arguments
});




}
/// @nodoc
class _$BuildCopyWithImpl<$Res>
    implements $BuildCopyWith<$Res> {
  _$BuildCopyWithImpl(this._self, this._then);

  final Build _self;
  final $Res Function(Build) _then;

/// Create a copy of Build
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? package = null,Object? arguments = freezed,}) {
  return _then(_self.copyWith(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,arguments: freezed == arguments ? _self.arguments : arguments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Build].
extension BuildPatterns on Build {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Build value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Build() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Build value)  $default,){
final _that = this;
switch (_that) {
case _Build():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Build value)?  $default,){
final _that = this;
switch (_that) {
case _Build() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String package, @JsonKey(includeIfNull: false)  List<String>? arguments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Build() when $default != null:
return $default(_that.package,_that.arguments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String package, @JsonKey(includeIfNull: false)  List<String>? arguments)  $default,) {final _that = this;
switch (_that) {
case _Build():
return $default(_that.package,_that.arguments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String package, @JsonKey(includeIfNull: false)  List<String>? arguments)?  $default,) {final _that = this;
switch (_that) {
case _Build() when $default != null:
return $default(_that.package,_that.arguments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Build implements Build {
  const _Build({required this.package, @JsonKey(includeIfNull: false) final  List<String>? arguments}): _arguments = arguments;
  factory _Build.fromJson(Map<String, dynamic> json) => _$BuildFromJson(json);

@override final  String package;
/// Build Arguments
 final  List<String>? _arguments;
/// Build Arguments
@override@JsonKey(includeIfNull: false) List<String>? get arguments {
  final value = _arguments;
  if (value == null) return null;
  if (_arguments is EqualUnmodifiableListView) return _arguments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Build
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuildCopyWith<_Build> get copyWith => __$BuildCopyWithImpl<_Build>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuildToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Build&&(identical(other.package, package) || other.package == package)&&const DeepCollectionEquality().equals(other._arguments, _arguments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,package,const DeepCollectionEquality().hash(_arguments));

@override
String toString() {
  return 'Build(package: $package, arguments: $arguments)';
}


}

/// @nodoc
abstract mixin class _$BuildCopyWith<$Res> implements $BuildCopyWith<$Res> {
  factory _$BuildCopyWith(_Build value, $Res Function(_Build) _then) = __$BuildCopyWithImpl;
@override @useResult
$Res call({
 String package,@JsonKey(includeIfNull: false) List<String>? arguments
});




}
/// @nodoc
class __$BuildCopyWithImpl<$Res>
    implements _$BuildCopyWith<$Res> {
  __$BuildCopyWithImpl(this._self, this._then);

  final _Build _self;
  final $Res Function(_Build) _then;

/// Create a copy of Build
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? package = null,Object? arguments = freezed,}) {
  return _then(_Build(
package: null == package ? _self.package : package // ignore: cast_nullable_to_non_nullable
as String,arguments: freezed == arguments ? _self._arguments : arguments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$Run {

 Runner get after; Runner get before;
/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunCopyWith<Run> get copyWith => _$RunCopyWithImpl<Run>(this as Run, _$identity);

  /// Serializes this Run to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Run&&(identical(other.after, after) || other.after == after)&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,after,before);

@override
String toString() {
  return 'Run(after: $after, before: $before)';
}


}

/// @nodoc
abstract mixin class $RunCopyWith<$Res>  {
  factory $RunCopyWith(Run value, $Res Function(Run) _then) = _$RunCopyWithImpl;
@useResult
$Res call({
 Runner after, Runner before
});


$RunnerCopyWith<$Res> get after;$RunnerCopyWith<$Res> get before;

}
/// @nodoc
class _$RunCopyWithImpl<$Res>
    implements $RunCopyWith<$Res> {
  _$RunCopyWithImpl(this._self, this._then);

  final Run _self;
  final $Res Function(Run) _then;

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? after = null,Object? before = null,}) {
  return _then(_self.copyWith(
after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Runner,before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Runner,
  ));
}
/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunnerCopyWith<$Res> get after {
  
  return $RunnerCopyWith<$Res>(_self.after, (value) {
    return _then(_self.copyWith(after: value));
  });
}/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunnerCopyWith<$Res> get before {
  
  return $RunnerCopyWith<$Res>(_self.before, (value) {
    return _then(_self.copyWith(before: value));
  });
}
}


/// Adds pattern-matching-related methods to [Run].
extension RunPatterns on Run {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Run value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Run() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Run value)  $default,){
final _that = this;
switch (_that) {
case _Run():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Run value)?  $default,){
final _that = this;
switch (_that) {
case _Run() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Runner after,  Runner before)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Run() when $default != null:
return $default(_that.after,_that.before);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Runner after,  Runner before)  $default,) {final _that = this;
switch (_that) {
case _Run():
return $default(_that.after,_that.before);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Runner after,  Runner before)?  $default,) {final _that = this;
switch (_that) {
case _Run() when $default != null:
return $default(_that.after,_that.before);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Run implements Run {
  const _Run({required this.after, required this.before});
  factory _Run.fromJson(Map<String, dynamic> json) => _$RunFromJson(json);

@override final  Runner after;
@override final  Runner before;

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunCopyWith<_Run> get copyWith => __$RunCopyWithImpl<_Run>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Run&&(identical(other.after, after) || other.after == after)&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,after,before);

@override
String toString() {
  return 'Run(after: $after, before: $before)';
}


}

/// @nodoc
abstract mixin class _$RunCopyWith<$Res> implements $RunCopyWith<$Res> {
  factory _$RunCopyWith(_Run value, $Res Function(_Run) _then) = __$RunCopyWithImpl;
@override @useResult
$Res call({
 Runner after, Runner before
});


@override $RunnerCopyWith<$Res> get after;@override $RunnerCopyWith<$Res> get before;

}
/// @nodoc
class __$RunCopyWithImpl<$Res>
    implements _$RunCopyWith<$Res> {
  __$RunCopyWithImpl(this._self, this._then);

  final _Run _self;
  final $Res Function(_Run) _then;

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? after = null,Object? before = null,}) {
  return _then(_Run(
after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Runner,before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Runner,
  ));
}

/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunnerCopyWith<$Res> get after {
  
  return $RunnerCopyWith<$Res>(_self.after, (value) {
    return _then(_self.copyWith(after: value));
  });
}/// Create a copy of Run
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RunnerCopyWith<$Res> get before {
  
  return $RunnerCopyWith<$Res>(_self.before, (value) {
    return _then(_self.copyWith(before: value));
  });
}
}


/// @nodoc
mixin _$Runner {

 List<String> get commands; String? get pwd;
/// Create a copy of Runner
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RunnerCopyWith<Runner> get copyWith => _$RunnerCopyWithImpl<Runner>(this as Runner, _$identity);

  /// Serializes this Runner to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Runner&&const DeepCollectionEquality().equals(other.commands, commands)&&(identical(other.pwd, pwd) || other.pwd == pwd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(commands),pwd);

@override
String toString() {
  return 'Runner(commands: $commands, pwd: $pwd)';
}


}

/// @nodoc
abstract mixin class $RunnerCopyWith<$Res>  {
  factory $RunnerCopyWith(Runner value, $Res Function(Runner) _then) = _$RunnerCopyWithImpl;
@useResult
$Res call({
 List<String> commands, String? pwd
});




}
/// @nodoc
class _$RunnerCopyWithImpl<$Res>
    implements $RunnerCopyWith<$Res> {
  _$RunnerCopyWithImpl(this._self, this._then);

  final Runner _self;
  final $Res Function(Runner) _then;

/// Create a copy of Runner
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? commands = null,Object? pwd = freezed,}) {
  return _then(_self.copyWith(
commands: null == commands ? _self.commands : commands // ignore: cast_nullable_to_non_nullable
as List<String>,pwd: freezed == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Runner].
extension RunnerPatterns on Runner {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Runner value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Runner() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Runner value)  $default,){
final _that = this;
switch (_that) {
case _Runner():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Runner value)?  $default,){
final _that = this;
switch (_that) {
case _Runner() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> commands,  String? pwd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Runner() when $default != null:
return $default(_that.commands,_that.pwd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> commands,  String? pwd)  $default,) {final _that = this;
switch (_that) {
case _Runner():
return $default(_that.commands,_that.pwd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> commands,  String? pwd)?  $default,) {final _that = this;
switch (_that) {
case _Runner() when $default != null:
return $default(_that.commands,_that.pwd);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Runner implements Runner {
  const _Runner({required final  List<String> commands, required this.pwd}): _commands = commands;
  factory _Runner.fromJson(Map<String, dynamic> json) => _$RunnerFromJson(json);

 final  List<String> _commands;
@override List<String> get commands {
  if (_commands is EqualUnmodifiableListView) return _commands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commands);
}

@override final  String? pwd;

/// Create a copy of Runner
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RunnerCopyWith<_Runner> get copyWith => __$RunnerCopyWithImpl<_Runner>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RunnerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Runner&&const DeepCollectionEquality().equals(other._commands, _commands)&&(identical(other.pwd, pwd) || other.pwd == pwd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_commands),pwd);

@override
String toString() {
  return 'Runner(commands: $commands, pwd: $pwd)';
}


}

/// @nodoc
abstract mixin class _$RunnerCopyWith<$Res> implements $RunnerCopyWith<$Res> {
  factory _$RunnerCopyWith(_Runner value, $Res Function(_Runner) _then) = __$RunnerCopyWithImpl;
@override @useResult
$Res call({
 List<String> commands, String? pwd
});




}
/// @nodoc
class __$RunnerCopyWithImpl<$Res>
    implements _$RunnerCopyWith<$Res> {
  __$RunnerCopyWithImpl(this._self, this._then);

  final _Runner _self;
  final $Res Function(_Runner) _then;

/// Create a copy of Runner
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? commands = null,Object? pwd = freezed,}) {
  return _then(_Runner(
commands: null == commands ? _self._commands : commands // ignore: cast_nullable_to_non_nullable
as List<String>,pwd: freezed == pwd ? _self.pwd : pwd // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
