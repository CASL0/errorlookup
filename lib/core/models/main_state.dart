import "package:errorlookup/core/models/theme_data.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "main_state.freezed.dart";

@freezed
class MainState with _$MainState {
  const factory MainState({@Default(ThemeMode.system) ThemeMode theme}) =
      _MainState;
}
