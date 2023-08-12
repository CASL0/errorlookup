import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "route.freezed.dart";

@freezed
class AppRoute with _$AppRoute {
  const factory AppRoute(
      {String? name, @Default("") String path, Widget? page}) = _AppRoute;
}
