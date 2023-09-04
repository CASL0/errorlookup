import 'dart:async';

import 'package:errorlookup/core/data/repository/settings_repository.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/core/models/theme_data.dart';

/// 設定のリポジトリ層のフェイク
class FakeSettingsRepository implements SettingsRepository {
  final _themeStreamController = StreamController<ThemeMode>();

  @override
  Stream<ThemeMode> getThemeSettingStream() {
    return _themeStreamController.stream;
  }

  @override
  Future<Result<bool, Exception>> saveThemeSetting(
      {required ThemeMode newMode}) async {
    _themeStreamController.sink.add(newMode);
    return const Success(true);
  }
}
