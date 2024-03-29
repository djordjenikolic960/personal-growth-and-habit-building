import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen.dart';
import '../../../common/constant/constant.dart';
import '../../di/service_locator.dart';
import '../../home/home_screen.dart';

import '../../challenges/challenges_screen.dart';
import '../../progress/progress_screen.dart';
import '../../settings/settings_screen.dart';
import 'bloc/bottom_navigation_bloc.dart';
import 'bloc/bottom_navigation_event.dart';
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
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (blocContext, state) {
        final selectedScreenIndex =
            (state as BottomNavigationSelectedScreen).screen.index;
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color(0xFFFFF5FA),
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              blocContext.read<BottomNavigationBloc>().add(
                    TabChanged(
                      Screen.values[index],
                    ),
                  );
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedScreenIndex,
            selectedIconTheme: const IconThemeData(
              color: Color(0xFFF65B4E),
            ),
            unselectedIconTheme: const IconThemeData(
              color: Color(0xFFBDBDBD),
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: Constant.emptyString,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events),
                label: Constant.emptyString,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insights),
                label: Constant.emptyString,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: Constant.emptyString,
              ),
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  color: const Color(0xFFFFF3E9),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    'assets/images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                _screens[selectedScreenIndex],
              ],
            ),
          ),
        );
      }),
    );
  }
}
