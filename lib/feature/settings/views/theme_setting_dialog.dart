import 'package:errorlookup/core/models/theme_data.dart' as theme_data;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// テーマ設定変更ダイアログ
class ThemeSettingDialog extends StatelessWidget {
  const ThemeSettingDialog(
      {super.key,
      required final theme_data.ThemeMode selectedTheme,
      required final void Function(theme_data.ThemeMode) themeChanged})
      : _selectedTheme = selectedTheme,
        _themeChanged = themeChanged;

  final theme_data.ThemeMode _selectedTheme;
  final void Function(theme_data.ThemeMode) _themeChanged;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Theme"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: theme_data.ThemeMode.values
            .map((e) => RadioListTile(
                value: e,
                title: Text(theme_data.themeDisplayName[e]!),
                groupValue: _selectedTheme,
                onChanged: (e) {
                  if (e != null) {
                    _themeChanged(e);
                  }
                  context.pop();
                }))
            .toList(),
      ),
      actions: [
        TextButton(onPressed: () => context.pop(), child: const Text("Close"))
      ],
    );
  }
}
