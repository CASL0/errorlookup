import 'package:errorlookup/core/common/views/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// アプリについて画面
class AboutPage extends ConsumerWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: TopAppBar(
          currentRouteName: "about",
        ),
        body: ListView(
          children: const [
            ListTile(
              title: Text("App version"),
              // 仮で固定値のバージョン表示
              trailing: Text("1.0.0"),
            )
          ],
        ));
  }
}
