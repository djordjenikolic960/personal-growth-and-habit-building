import 'package:go_router/go_router.dart';
import '../../../domain/use_case/onboarding/is_onboarding_completed_use_case.dart';
import '../../choose_category/choose_category_screen.dart';
import '../../create_habit/create_habit_screen.dart';
import '../../log_in/login_screen.dart';
import '../../onboarding/onboarding_screen.dart';
import '../../sign_up/sign_up_screen.dart';
import '../bottom_navigation/bottom_navigation_screen.dart';
import 'grow_daily_router.dart';

import '../../challenges/challenges_screen.dart';
import '../../home/home_screen.dart';
import '../../progress/progress_screen.dart';
import '../../settings/settings_screen.dart';
import 'grow_daily_route.dart';

class GrowDailyRouterImpl implements GrowDailyRouter {
  late final GoRouter _router;
  final IsOnboardingCompletedUseCase? _isOnboardingCompletedUseCase;

  GrowDailyRouterImpl(
    this._router,
    this._isOnboardingCompletedUseCase,
  );

  GrowDailyRouterImpl.defaultRouter(this._isOnboardingCompletedUseCase) {
    _router = GoRouter(
        initialLocation: GrowDailyRoute.bottomNavigation.path,
        redirect: (context, state) async {
          return await _getRedirectRoute(state);
        },
        routes: [
          _onBoardingRoute(),
          _loginRoute(),
          _signUpRoute(),
          _chooseCategoryRoute(),
          _bottomNavigationRoute(),
          _homeRoute(),
          _challengesRoute(),
          _progressRoute(),
          _settingRoute(),
          _createHabitRoute(),
        ]);
  }

  Future<String?> _getRedirectRoute(GoRouterState state) async {
    final isCompleted = await _isOnboardingCompletedUseCase!.isCompleted();
    final currentPath = state.path;

    /// todo probably need to check if log in is valid at this point
    if (!isCompleted && currentPath != GrowDailyRoute.onboarding.path) {
      return GrowDailyRoute.onboarding.path;
    } else if (isCompleted &&
        (currentPath == GrowDailyRoute.onboarding.path || currentPath == '/')) {
      return GrowDailyRoute.logIn.path;
    }

    return null;
  }

  @override
  GoRouter getRouter() => _router;

  RouteBase _loginRoute() => GoRoute(
        name: GrowDailyRoute.logIn.routerName,
        path: GrowDailyRoute.logIn.path,
        builder: (_, __) => const LoginScreen(),
      );

  RouteBase _onBoardingRoute() => GoRoute(
        name: GrowDailyRoute.onboarding.routerName,
        path: GrowDailyRoute.onboarding.path,
        builder: (_, __) => const OnBoardingScreen(),
      );

  RouteBase _signUpRoute() => GoRoute(
        name: GrowDailyRoute.signUp.routerName,
        path: GrowDailyRoute.signUp.path,
        builder: (_, __) => const SignUpScreen(),
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

  RouteBase _createHabitRoute() => GoRoute(
        name: GrowDailyRoute.createHabit.routerName,
        path: GrowDailyRoute.createHabit.path,
        builder: (_, __) => const CreateHabitScreen(),
      );
}
