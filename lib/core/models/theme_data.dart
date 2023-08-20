import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// テーマのモード
enum ThemeMode { system, light, dark }

final convertTheme = {
  ThemeMode.system: material.ThemeMode.system,
  ThemeMode.light: material.ThemeMode.light,
  ThemeMode.dark: material.ThemeMode.dark
};

/// テーマのモードの表示名
String themeDisplayName(
    {required final BuildContext context, required final ThemeMode mode}) {
  switch (mode) {
    case ThemeMode.system:
      return AppLocalizations.of(context)!.themeSystem;
    case ThemeMode.light:
      return AppLocalizations.of(context)!.themeLight;
    case ThemeMode.dark:
      return AppLocalizations.of(context)!.themeDark;
    default:
      return "UNKNOWN";
  }
}
