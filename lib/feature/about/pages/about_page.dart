import 'package:errorlookup/core/common/views/top_app_bar.dart';
import 'package:errorlookup/feature/about/viewmodels/about_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリについて画面
class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(aboutViewModelProvider);
    return Scaffold(
        appBar: TopAppBar(
          currentRouteName: "about",
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text("App version"),
              trailing: Text("${uiState.version} (${uiState.buildNumber})"),
            )
          ],
        ));
  }
}