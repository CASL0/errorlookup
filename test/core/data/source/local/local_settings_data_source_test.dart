import "package:errorlookup/core/data/source/local/local_settings_data_source.dart";
import "package:errorlookup/core/models/result.dart";
import "package:errorlookup/core/models/theme_data.dart";
import "package:flutter_test/flutter_test.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() {
  group("LocalSettingsDataSourceTest", () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });
    test("テーマ設定がプリファレンスにない場合はシステムを初期値として保存する", () async {
      final dataSource = LocalSettingsDataSource(initialize: false);
      await dataSource.init();
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString("theme"), "theme_system");
    });
    test("設定変更後ストリームに流れてくる", () async {
      final dataSource = LocalSettingsDataSource();
      final verifyStream = expectLater(
          dataSource.getThemeSettingStream(), emitsInOrder([ThemeMode.dark]));
      final ret = await dataSource.saveThemeSetting(newMode: ThemeMode.dark);
      expect(ret is Success, true);
      await verifyStream;
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString("theme"), "theme_dark");
    });
  });
}
