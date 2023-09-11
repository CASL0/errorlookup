import "package:errorlookup/core/common/views/top_app_bar.dart";
import "package:errorlookup/feature/settings/viewmodels/settings_view_model.dart";
import "package:errorlookup/feature/settings/views/theme_setting_dialog.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

/// 設定画面のウィジェット
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsViewModelProvider.notifier);
    final uiState = ref.watch(settingsViewModelProvider);
    return Scaffold(
        appBar: TopAppBar(
          currentRouteName: "settings",
        ),
        body: ListView(
          children: [
            ListTile(
                title: Text(AppLocalizations.of(context)!.theme),
                onTap: () {
                  showDialog<void>(
                      context: context,
                      builder: (context) => ThemeSettingDialog(
                          selectedTheme: uiState.theme,
                          themeChanged: (e) {
                            viewModel.saveThemeSetting(newMode: e);
                          }));
                }),
          ],
        ));
  }
}
