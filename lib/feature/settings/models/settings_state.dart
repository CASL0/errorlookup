import "package:errorlookup/core/models/theme_data.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "settings_state.freezed.dart";

/// 設定画面のUI状態
@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({@Default(ThemeMode.system) ThemeMode theme}) =
      _SettingsState;
}
