import "package:errorlookup/core/models/result.dart";
import "package:errorlookup/core/models/theme_data.dart";

/// 設定のデータ層のインターフェース
abstract interface class SettingsDataSource {
  /// テーマ設定のストリームを取得します
  Stream<ThemeMode> getThemeSettingStream();

  /// テーマ設定を保存します
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final ThemeMode newMode});
}
