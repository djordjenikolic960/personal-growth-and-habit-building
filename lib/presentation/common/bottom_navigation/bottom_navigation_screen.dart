import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/constant/constant.dart';
import '../../di/service_locator.dart';
import '../../home/home_screen.dart';

import '../../challenges/challenges_screen.dart';
import '../../progress/progress_screen.dart';
import '../../settings/settings_screen.dart';
import 'bloc/bottom_navigation_bloc.dart';
import 'bloc/bottom_navigation_state.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  final _screens = [
    const HomeScreen(),
    const ChallengesScreen(),
    const ProgressScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (_) => serviceLocator.get<BottomNavigationBloc>(),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: Constant.emptyString,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: Constant.emptyString,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: Constant.emptyString,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: Constant.emptyString,
              ),
            ],
          ),
          body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (_, state) {
              if (state is BottomNavigationSelectedScreen) {
                return _screens[state.screen.index];
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
