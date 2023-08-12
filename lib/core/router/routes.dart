import 'package:errorlookup/core/router/route.dart';
import 'package:errorlookup/feature/about/pages/about_page.dart';
import 'package:errorlookup/feature/home/pages/home_page.dart';

final Set<AppRoute> appRoutes = {
  const AppRoute(
      name: "home", path: "/home", page: HomePage(), shouldViewActions: true),
  const AppRoute(
      name: "about",
      path: "/about",
      page: AboutPage(),
      shouldViewActions: false)
};
