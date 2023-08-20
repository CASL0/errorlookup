import 'package:flutter/material.dart' as material;

/// テーマのモード
enum ThemeMode { system, light, dark }

/// テーマのモードの表示名
final themeDisplayName = {
  ThemeMode.system: "System",
  ThemeMode.light: "Light",
  ThemeMode.dark: "Dark"
};

final convertTheme = {
  ThemeMode.system: material.ThemeMode.system,
  ThemeMode.light: material.ThemeMode.light,
  ThemeMode.dark: material.ThemeMode.dark
};
