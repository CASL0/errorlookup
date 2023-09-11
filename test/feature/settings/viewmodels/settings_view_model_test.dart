import "package:errorlookup/core/data/repository/settings_repository.dart";
import "package:errorlookup/core/models/result.dart";
import "package:errorlookup/core/models/theme_data.dart";
import "package:errorlookup/feature/settings/models/settings_state.dart";
import "package:errorlookup/feature/settings/viewmodels/settings_view_model.dart";
import "package:flutter_test/flutter_test.dart";

import "../../../core/data/repository/fake_settings_repository.dart";

void main() {
  late SettingsRepository repository;
  group("SettingsViewModelTest", () {
    setUp(() => repository = FakeSettingsRepository());
    test("初期状態のテーマはシステム", () {
      final viewModel = SettingsViewModel(settingsRepository: repository);
      expect(
          viewModel.debugState, const SettingsState(theme: ThemeMode.system));
    });
    test("saveした後にstateが更新される", () async {
      final viewModel = SettingsViewModel(settingsRepository: repository);
      final ret = await viewModel.saveThemeSetting(newMode: ThemeMode.light);
      expect(ret is Success, true);
      expect(viewModel.debugState, const SettingsState(theme: ThemeMode.light));
    });
  });
}
