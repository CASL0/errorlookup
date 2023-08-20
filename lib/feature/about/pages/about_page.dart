import 'package:errorlookup/core/common/views/top_app_bar.dart';
import 'package:errorlookup/feature/about/viewmodels/about_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリについて画面
class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(aboutViewModelProvider);
    final viewModel = ref.watch(aboutViewModelProvider.notifier);
    return Scaffold(
        appBar: TopAppBar(
          currentRouteName: "about",
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text(AppLocalizations.of(context)!.version),
              trailing: Text("${uiState.version} (${uiState.buildNumber})"),
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.source),
              onTap: viewModel.launchSource,
            ),
            ListTile(
              title: Text(AppLocalizations.of(context)!.licenses),
              onTap: () => showLicensePage(context: context),
            )
          ],
        ));
  }
}
