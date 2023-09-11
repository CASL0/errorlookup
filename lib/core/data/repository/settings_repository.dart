import "package:errorlookup/core/models/result.dart";
import "package:errorlookup/core/models/theme_data.dart";

/// 設定値のリポジトリ層のインターフェース
abstract interface class SettingsRepository {
  /// テーマ設定のストリームを取得します
  Stream<ThemeMode> getThemeSettingStream();

  /// テーマ設定を保存します
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final ThemeMode newMode});
}
