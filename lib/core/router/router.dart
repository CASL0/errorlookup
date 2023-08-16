import 'package:errorlookup/core/router/routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
    initialLocation:
        appRoutes.firstWhere((element) => element.name == homeRouteName).path,
    routes: appRoutes
        .where((element) => element.page != null)
        .map((e) => GoRoute(
              path: e.path,
              name: e.name,
              builder: (context, state) => e.page!,
            ))
        .toList());
