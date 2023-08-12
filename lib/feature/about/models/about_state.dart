import 'package:freezed_annotation/freezed_annotation.dart';

part "about_state.freezed.dart";

/// アプリについて画面のUI状態
@freezed
class AboutState with _$AboutState {
  const factory AboutState(
      {@Default("") String version,
      @Default("") String buildNumber}) = _AboutState;
}
