import 'package:errorlookup/core/data/repository/settings_repository.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/core/models/theme_data.dart' as theme_data;
import 'package:errorlookup/feature/settings/models/settings_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

/// 設定画面のビジネスロジックを扱うVieModel
class SettingsViewModel extends StateNotifier<SettingsState> {
  SettingsViewModel({required final SettingsRepository settingsRepository})
      : _settingsRepository = settingsRepository,
        super(const SettingsState()) {
    _settingsRepository.getThemeSettingStream().listen((event) {
      state = state.copyWith(theme: event);
    });
  }

  final SettingsRepository _settingsRepository;

  /// テーマ設定を保存します
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final theme_data.ThemeMode newMode}) async {
    return await _settingsRepository.saveThemeSetting(newMode: newMode);
  }
}

final settingsViewModelProvider =
    StateNotifierProvider<SettingsViewModel, SettingsState>((ref) =>
        SettingsViewModel(settingsRepository: GetIt.I<SettingsRepository>()));
