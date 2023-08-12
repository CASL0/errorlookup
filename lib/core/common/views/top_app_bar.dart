import 'package:errorlookup/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// TopAppBar
class TopAppBar extends AppBar {
  TopAppBar({super.key, required String currentRouteName})
      : _currentRouteName = currentRouteName;
  final String _currentRouteName;

  @override
  Widget? get title => const Text("errorlookup");
  @override
  List<Widget>? get actions => shouldViewActions()
      ? [
          PopupMenuButton(itemBuilder: ((context) {
            return _actions
                .map((e) => PopupMenuItem(
                      value: e,
                      child: TextButton.icon(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          context.pushNamed("about");
                        },
                        label: Text(e),
                      ),
                    ))
                .toList();
          }))
        ]
      : null;

  /// アクションボタンを表示するか
  bool shouldViewActions() {
    return appRoutes
        .where((element) => element.shouldViewActions)
        .any((element) => element.name == _currentRouteName);
  }
}

/// TopAppBarのアクション
final Set<String> _actions = {"ABOUT"};
