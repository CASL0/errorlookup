import 'dart:async';

import 'package:errorlookup/core/data/source/settings_data_source.dart';
import 'package:errorlookup/core/models/result.dart';
import 'package:errorlookup/core/models/theme_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// データ層の実装
class LocalSettingsDataSource implements SettingsDataSource {
  /// テーマ設定のプリファレンスマップ
  static const _themeValue = {
    ThemeMode.system: "theme_system",
    ThemeMode.dark: "theme_dark",
    ThemeMode.light: "theme_light"
  };

  /// テーマ設定のインバースマップ
  static final _themeValueInverse =
      _themeValue.map((key, value) => MapEntry(value, key));

  static const _themeKey = "theme";

  /// テーマ設定のストリーム
  final _themeSettingStreamController = StreamController<ThemeMode>.broadcast();

  LocalSettingsDataSource({bool initialize = true}) {
    if (initialize) {
      init();
    }
  }

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedValue = prefs.getString(_themeKey);
    if (savedValue == null) {
      prefs.setString(_themeKey, "theme_system");
      _themeSettingStreamController.sink
          .add(_themeValueInverse["theme_system"]!);
    } else {
      _themeSettingStreamController.sink.add(_themeValueInverse[savedValue]!);
    }
  }

  @override
  Stream getThemeSettingStream() {
    return _themeSettingStreamController.stream;
  }

  @override
  Future<Result<bool, Exception>> saveThemeSetting(
      {required final ThemeMode newMode}) async {
    final prefs = await SharedPreferences.getInstance();
    final convertedValue = _themeValue[newMode];
    if (convertedValue == null) {
      return Failure(Exception("preference value is not found"));
    }
    final ret = await prefs.setString(_themeKey, convertedValue);
    if (!ret) {
      return Failure(Exception("SharedPreferences.setString fail"));
    }
    _themeSettingStreamController.sink.add(newMode);
    return const Success(true);
  }
}
