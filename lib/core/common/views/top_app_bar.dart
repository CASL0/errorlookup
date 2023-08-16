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
                .where((element) => element != homeRouteName)
                .map((e) => PopupMenuItem(
                      value: e,
                      onTap: () => context.pushNamed(e),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info,
                            color: Theme.of(context).primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(e.toUpperCase()),
                          )
                        ],
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
final _actions = appRoutes.map((e) => e.name).toSet();
