import 'dart:async';

import 'package:errorlookup/core/data/source/settings_data_source.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/core/models/theme_data.dart';

/// 設定のデータ層のフェイク
class FakeSettingsDataSource implements SettingsDataSource {
  final _themeSettingStreamController = StreamController<ThemeMode>();

  @override
  Stream getThemeSettingStream() {
    return _themeSettingStreamController.stream;
  }

  @override
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final ThemeMode newMode}) async {
    _themeSettingStreamController.sink.add(newMode);
    return const Success(true);
  }
}
