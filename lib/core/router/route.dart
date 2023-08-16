import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "route.freezed.dart";

@freezed
class AppRoute with _$AppRoute {
  const factory AppRoute(
      {@Default("") String name,
      @Default("") String path,
      Widget? page,
      @Default(true) bool shouldViewActions}) = _AppRoute;
}
