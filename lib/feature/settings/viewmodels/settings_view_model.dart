import 'package:errorlookup/core/data/repository/default_settings_repository.dart';
import 'package:errorlookup/core/data/repository/settings_repository.dart';
import 'package:errorlookup/core/data/source/local/local_settings_data_source.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/core/models/theme_data.dart' as theme_data;
import 'package:errorlookup/feature/settings/models/settings_state.dart';
import 'package:errorlookup/feature/settings/views/theme_setting_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 設定画面のビジネスロジックを扱うVieModel
class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel({required final SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(const SettingsState()) {
    _settingsRepository.getThemeSettingStream().listen((event) {
      if (event is theme_data.ThemeMode) {
        state = state.copyWith(theme: event);
      }
    });
  }

  final SettingsRepository _settingsRepository;

  /// テーマ設定を保存します
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final theme_data.ThemeMode newMode}) async {
    return await _settingsRepository.saveThemeSetting(newMode: newMode);
  }

  /// テーマ設定画面を開きます
  void openThemeSetting(final BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => ThemeSettingDialog(
            selectedTheme: state.theme,
            themeChanged: (e) {
              saveThemeSetting(newMode: e);
            }));
  }
}

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>((ref) =>
        SettingsViewModel(
            settingsRepository: DefaultSettingsRepository(
                dataSource: LocalSettingsDataSource())));
