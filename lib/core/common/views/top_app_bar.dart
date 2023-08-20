import 'package:errorlookup/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
                            _actionsDisplay(context: context, action: e).icon,
                            color: Theme.of(context).primaryColor,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                                _actionsDisplay(context: context, action: e)
                                    .displayName),
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

  /// アクションの表示名を取得
  ({String displayName, IconData icon}) _actionsDisplay(
      {required final BuildContext context, required final String action}) {
    switch (action) {
      case "about":
        return (
          displayName: AppLocalizations.of(context)!.about,
          icon: Icons.info
        );
      case "settings":
        return (
          displayName: AppLocalizations.of(context)!.settings,
          icon: Icons.settings
        );
      default:
        return (displayName: "UNKNOWN", icon: Icons.abc);
    }
  }
}

/// TopAppBarのアクション
final _actions = appRoutes.map((e) => e.name).toSet();
