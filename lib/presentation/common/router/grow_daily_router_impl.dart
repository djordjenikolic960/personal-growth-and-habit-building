import 'package:go_router/go_router.dart';
import '../../choose_category/choose_category_screen.dart';
import '../../log_in/login_screen.dart';
import '../bottom_navigation/bottom_navigation_screen.dart';
import 'grow_daily_router.dart';

import '../../challenges/challenges_screen.dart';
import '../../home/home_screen.dart';
import '../../progress/progress_screen.dart';
import '../../settings/settings_screen.dart';
import 'grow_daily_route.dart';

class GrowDailyRouterImpl implements GrowDailyRouter {
  late final GoRouter _router;

  GrowDailyRouterImpl(this._router);

  GrowDailyRouterImpl.defaultRouter() {
    _router = GoRouter(routes: [
      _loginRoute(),
      _chooseCategoryRoute(),
      _bottomNavigationRoute(),
      _homeRoute(),
      _challengesRoute(),
      _progressRoute(),
      _settingRoute(),
    ]);
  }

  @override
  GoRouter getRouter() => _router;

  RouteBase _loginRoute() => GoRoute(
    name: GrowDailyRoute.logIn.routerName,
    path: GrowDailyRoute.logIn.path,
    builder: (_, __) => const LoginScreen(),
  );

  RouteBase _chooseCategoryRoute() => GoRoute(
        name: GrowDailyRoute.chooseCategory.routerName,
        path: GrowDailyRoute.chooseCategory.path,
        builder: (_, __) => const ChooseCategoryScreen(),
      );

  RouteBase _bottomNavigationRoute() => GoRoute(
        name: GrowDailyRoute.bottomNavigation.routerName,
        path: GrowDailyRoute.bottomNavigation.path,
        builder: (_, __) => BottomNavigationScreen(),
      );

  RouteBase _homeRoute() => GoRoute(
        name: GrowDailyRoute.home.routerName,
        path: GrowDailyRoute.home.path,
        builder: (_, __) => const HomeScreen(),
      );

  RouteBase _challengesRoute() => GoRoute(
        name: GrowDailyRoute.challenges.routerName,
        path: GrowDailyRoute.challenges.path,
        builder: (_, __) => const ChallengesScreen(),
      );

  RouteBase _progressRoute() => GoRoute(
        name: GrowDailyRoute.progress.routerName,
        path: GrowDailyRoute.progress.path,
        builder: (_, __) => const ProgressScreen(),
      );

  RouteBase _settingRoute() => GoRoute(
        name: GrowDailyRoute.settings.routerName,
        path: GrowDailyRoute.settings.path,
        builder: (_, __) => const SettingsScreen(),
      );
}
