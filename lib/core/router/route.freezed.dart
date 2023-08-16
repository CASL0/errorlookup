// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppRoute {
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  Widget? get page => throw _privateConstructorUsedError;
  bool get shouldViewActions => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppRouteCopyWith<AppRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRouteCopyWith<$Res> {
  factory $AppRouteCopyWith(AppRoute value, $Res Function(AppRoute) then) =
      _$AppRouteCopyWithImpl<$Res, AppRoute>;
  @useResult
  $Res call({String name, String path, Widget? page, bool shouldViewActions});
}

/// @nodoc
class _$AppRouteCopyWithImpl<$Res, $Val extends AppRoute>
    implements $AppRouteCopyWith<$Res> {
  _$AppRouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? page = freezed,
    Object? shouldViewActions = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Widget?,
      shouldViewActions: null == shouldViewActions
          ? _value.shouldViewActions
          : shouldViewActions // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppRouteCopyWith<$Res> implements $AppRouteCopyWith<$Res> {
  factory _$$_AppRouteCopyWith(
          _$_AppRoute value, $Res Function(_$_AppRoute) then) =
      __$$_AppRouteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String path, Widget? page, bool shouldViewActions});
}

/// @nodoc
class __$$_AppRouteCopyWithImpl<$Res>
    extends _$AppRouteCopyWithImpl<$Res, _$_AppRoute>
    implements _$$_AppRouteCopyWith<$Res> {
  __$$_AppRouteCopyWithImpl(
      _$_AppRoute _value, $Res Function(_$_AppRoute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? page = freezed,
    Object? shouldViewActions = null,
  }) {
    return _then(_$_AppRoute(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as Widget?,
      shouldViewActions: null == shouldViewActions
          ? _value.shouldViewActions
          : shouldViewActions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AppRoute implements _AppRoute {
  const _$_AppRoute(
      {this.name = "",
      this.path = "",
      this.page,
      this.shouldViewActions = true});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String path;
  @override
  final Widget? page;
  @override
  @JsonKey()
  final bool shouldViewActions;

  @override
  String toString() {
    return 'AppRoute(name: $name, path: $path, page: $page, shouldViewActions: $shouldViewActions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppRoute &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.shouldViewActions, shouldViewActions) ||
                other.shouldViewActions == shouldViewActions));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, path, page, shouldViewActions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppRouteCopyWith<_$_AppRoute> get copyWith =>
      __$$_AppRouteCopyWithImpl<_$_AppRoute>(this, _$identity);
}

abstract class _AppRoute implements AppRoute {
  const factory _AppRoute(
      {final String name,
      final String path,
      final Widget? page,
      final bool shouldViewActions}) = _$_AppRoute;

  @override
  String get name;
  @override
  String get path;
  @override
  Widget? get page;
  @override
  bool get shouldViewActions;
  @override
  @JsonKey(ignore: true)
  _$$_AppRouteCopyWith<_$_AppRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
