// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<ErrorDetail> get windowsErrorDetails =>
      throw _privateConstructorUsedError;
  List<ErrorDetail> get linuxErrorDetails => throw _privateConstructorUsedError;
  List<ErrorDetail> get curlErrorDetails => throw _privateConstructorUsedError;
  bool get isFetchingErrorCodes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<ErrorDetail> windowsErrorDetails,
      List<ErrorDetail> linuxErrorDetails,
      List<ErrorDetail> curlErrorDetails,
      bool isFetchingErrorCodes});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowsErrorDetails = null,
    Object? linuxErrorDetails = null,
    Object? curlErrorDetails = null,
    Object? isFetchingErrorCodes = null,
  }) {
    return _then(_value.copyWith(
      windowsErrorDetails: null == windowsErrorDetails
          ? _value.windowsErrorDetails
          : windowsErrorDetails // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetail>,
      linuxErrorDetails: null == linuxErrorDetails
          ? _value.linuxErrorDetails
          : linuxErrorDetails // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetail>,
      curlErrorDetails: null == curlErrorDetails
          ? _value.curlErrorDetails
          : curlErrorDetails // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetail>,
      isFetchingErrorCodes: null == isFetchingErrorCodes
          ? _value.isFetchingErrorCodes
          : isFetchingErrorCodes // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ErrorDetail> windowsErrorDetails,
      List<ErrorDetail> linuxErrorDetails,
      List<ErrorDetail> curlErrorDetails,
      bool isFetchingErrorCodes});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? windowsErrorDetails = null,
    Object? linuxErrorDetails = null,
    Object? curlErrorDetails = null,
    Object? isFetchingErrorCodes = null,
  }) {
    return _then(_$_HomeState(
      windowsErrorDetails: null == windowsErrorDetails
          ? _value._windowsErrorDetails
          : windowsErrorDetails // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetail>,
      linuxErrorDetails: null == linuxErrorDetails
          ? _value._linuxErrorDetails
          : linuxErrorDetails // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetail>,
      curlErrorDetails: null == curlErrorDetails
          ? _value._curlErrorDetails
          : curlErrorDetails // ignore: cast_nullable_to_non_nullable
              as List<ErrorDetail>,
      isFetchingErrorCodes: null == isFetchingErrorCodes
          ? _value.isFetchingErrorCodes
          : isFetchingErrorCodes // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {final List<ErrorDetail> windowsErrorDetails = const [],
      final List<ErrorDetail> linuxErrorDetails = const [],
      final List<ErrorDetail> curlErrorDetails = const [],
      this.isFetchingErrorCodes = false})
      : _windowsErrorDetails = windowsErrorDetails,
        _linuxErrorDetails = linuxErrorDetails,
        _curlErrorDetails = curlErrorDetails;

  final List<ErrorDetail> _windowsErrorDetails;
  @override
  @JsonKey()
  List<ErrorDetail> get windowsErrorDetails {
    if (_windowsErrorDetails is EqualUnmodifiableListView)
      return _windowsErrorDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_windowsErrorDetails);
  }

  final List<ErrorDetail> _linuxErrorDetails;
  @override
  @JsonKey()
  List<ErrorDetail> get linuxErrorDetails {
    if (_linuxErrorDetails is EqualUnmodifiableListView)
      return _linuxErrorDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linuxErrorDetails);
  }

  final List<ErrorDetail> _curlErrorDetails;
  @override
  @JsonKey()
  List<ErrorDetail> get curlErrorDetails {
    if (_curlErrorDetails is EqualUnmodifiableListView)
      return _curlErrorDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_curlErrorDetails);
  }

  @override
  @JsonKey()
  final bool isFetchingErrorCodes;

  @override
  String toString() {
    return 'HomeState(windowsErrorDetails: $windowsErrorDetails, linuxErrorDetails: $linuxErrorDetails, curlErrorDetails: $curlErrorDetails, isFetchingErrorCodes: $isFetchingErrorCodes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other._windowsErrorDetails, _windowsErrorDetails) &&
            const DeepCollectionEquality()
                .equals(other._linuxErrorDetails, _linuxErrorDetails) &&
            const DeepCollectionEquality()
                .equals(other._curlErrorDetails, _curlErrorDetails) &&
            (identical(other.isFetchingErrorCodes, isFetchingErrorCodes) ||
                other.isFetchingErrorCodes == isFetchingErrorCodes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_windowsErrorDetails),
      const DeepCollectionEquality().hash(_linuxErrorDetails),
      const DeepCollectionEquality().hash(_curlErrorDetails),
      isFetchingErrorCodes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<ErrorDetail> windowsErrorDetails,
      final List<ErrorDetail> linuxErrorDetails,
      final List<ErrorDetail> curlErrorDetails,
      final bool isFetchingErrorCodes}) = _$_HomeState;

  @override
  List<ErrorDetail> get windowsErrorDetails;
  @override
  List<ErrorDetail> get linuxErrorDetails;
  @override
  List<ErrorDetail> get curlErrorDetails;
  @override
  bool get isFetchingErrorCodes;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
