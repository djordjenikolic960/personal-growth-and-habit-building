import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/di/service_locator.dart';
import '../bloc/app_config_bloc/app_config_bloc.dart';
import '../bloc/app_config_bloc/app_config_event.dart';
import '../bloc/app_config_bloc/app_config_state.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_state.dart';
import '../common/assets.dart';
import '../common/router/grow_daily_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  UserIsLoaded? _userLoadedState;
  bool? _isOnboardingCompleted;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppConfigBloc>(
      create: (_) =>
          serviceLocator.get<AppConfigBloc>()..add(CheckOnboardingCompletion()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserIsLoaded) {
                _userLoadedState = state;
              }

              _onLoaded();
            },
          ),
          BlocListener<AppConfigBloc, AppConfigState>(
            listener: (context, state) {
              if (state is OnboardingCompletionResult) {
                _isOnboardingCompleted = state.isCompleted;
              }
              _onLoaded();
            },
          ),
        ],
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(DailyGrowAssets.splash),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLoaded() {
    final userState = _userLoadedState;
    final isOnboardingCompleted = _isOnboardingCompleted;
    if (userState == null || isOnboardingCompleted == null) {
      // Not loaded yet
      return;
    }

    if (!isOnboardingCompleted) {
      context.go(GrowDailyRoute.onboarding.path);
      return;
    }

    context.go(GrowDailyRoute.bottomNavigation.path);
  }
}
