import "package:errorlookup/core/data/repository/default_settings_repository.dart";
import "package:errorlookup/core/data/source/settings_data_source.dart";
import "package:errorlookup/core/models/result.dart";
import "package:errorlookup/core/models/theme_data.dart";
import "package:flutter_test/flutter_test.dart";

import "../source/fake_settings_data_source.dart";

void main() {
  late SettingsDataSource dataSource;
  setUpAll(() => dataSource = FakeSettingsDataSource());
  group("DefaultSettingsRepositoryTest", () {
    test("saveした後にstreamに更新後の値が流れてくる", () async {
      final repository = DefaultSettingsRepository(dataSource: dataSource);
      final verifyStream = expectLater(
          repository.getThemeSettingStream(), emitsInOrder([ThemeMode.dark]));
      final ret = await repository.saveThemeSetting(newMode: ThemeMode.dark);
      expect(ret is Success<bool, Exception>, true);
      expect((ret as Success<bool, Exception>).value, true);
      await verifyStream;
    });
  });
}
