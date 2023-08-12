// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AboutState {
  String get version => throw _privateConstructorUsedError;
  String get buildNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AboutStateCopyWith<AboutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutStateCopyWith<$Res> {
  factory $AboutStateCopyWith(
          AboutState value, $Res Function(AboutState) then) =
      _$AboutStateCopyWithImpl<$Res, AboutState>;
  @useResult
  $Res call({String version, String buildNumber});
}

/// @nodoc
class _$AboutStateCopyWithImpl<$Res, $Val extends AboutState>
    implements $AboutStateCopyWith<$Res> {
  _$AboutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? buildNumber = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AboutStateCopyWith<$Res>
    implements $AboutStateCopyWith<$Res> {
  factory _$$_AboutStateCopyWith(
          _$_AboutState value, $Res Function(_$_AboutState) then) =
      __$$_AboutStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, String buildNumber});
}

/// @nodoc
class __$$_AboutStateCopyWithImpl<$Res>
    extends _$AboutStateCopyWithImpl<$Res, _$_AboutState>
    implements _$$_AboutStateCopyWith<$Res> {
  __$$_AboutStateCopyWithImpl(
      _$_AboutState _value, $Res Function(_$_AboutState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? buildNumber = null,
  }) {
    return _then(_$_AboutState(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      buildNumber: null == buildNumber
          ? _value.buildNumber
          : buildNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AboutState implements _AboutState {
  const _$_AboutState({this.version = "", this.buildNumber = ""});

  @override
  @JsonKey()
  final String version;
  @override
  @JsonKey()
  final String buildNumber;

  @override
  String toString() {
    return 'AboutState(version: $version, buildNumber: $buildNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AboutState &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.buildNumber, buildNumber) ||
                other.buildNumber == buildNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, version, buildNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AboutStateCopyWith<_$_AboutState> get copyWith =>
      __$$_AboutStateCopyWithImpl<_$_AboutState>(this, _$identity);
}

abstract class _AboutState implements AboutState {
  const factory _AboutState({final String version, final String buildNumber}) =
      _$_AboutState;

  @override
  String get version;
  @override
  String get buildNumber;
  @override
  @JsonKey(ignore: true)
  _$$_AboutStateCopyWith<_$_AboutState> get copyWith =>
      throw _privateConstructorUsedError;
}
