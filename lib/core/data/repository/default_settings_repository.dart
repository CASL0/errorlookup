import 'package:errorlookup/core/data/repository/settings_repository.dart';
import 'package:errorlookup/core/data/source/settings_data_source.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/core/models/theme_data.dart';

/// 設定値のリポジトリ層の実装
class DefaultSettingsRepository implements SettingsRepository {
  final SettingsDataSource _dataSource;
  DefaultSettingsRepository({required final SettingsDataSource dataSource})
      : _dataSource = dataSource;

  /// テーマ設定のストリームを取得します
  @override
  Stream<ThemeMode> getThemeSettingStream() {
    return _dataSource.getThemeSettingStream();
  }

  /// テーマ設定を保存します
  @override
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final ThemeMode newMode}) async {
    return _dataSource.saveThemeSetting(newMode: newMode);
  }
}
