import 'package:errorlookup/core/common/views/top_app_bar.dart';
import 'package:errorlookup/feature/settings/viewmodels/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 設定画面のウィジェット
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(settingsViewModelProvider.notifier);

    return Scaffold(
        appBar: TopAppBar(
          currentRouteName: "settings",
        ),
        body: ListView(
          children: [
            ListTile(
                title: const Text("Theme"),
                onTap: () => viewModel.openThemeSetting(context)),
          ],
        ));
  }
}
