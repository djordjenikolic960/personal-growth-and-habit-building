import '../../../common/constant/constant.dart';
import '../../challenges/challenges_screen.dart';
import '../../choose_category/choose_category_screen.dart';
import '../../home/home_screen.dart';
import '../../progress/progress_screen.dart';
import '../../settings/settings_screen.dart';
import '../bottom_navigation/bottom_navigation_screen.dart';

enum GrowDailyRoute {
  chooseCategory(ChooseCategoryScreen),
  bottomNavigation(BottomNavigationScreen),
  home(HomeScreen),
  challenges(ChallengesScreen),
  progress(ProgressScreen),
  settings(SettingsScreen);

  final Type _routeType;

  const GrowDailyRoute(this._routeType);

  String get routerName => "$_routeType";

  String get path {
    if (this == GrowDailyRoute.chooseCategory) {
      return Constant.slash;
    } else {
      return "${Constant.slash}$routerName";
    }
  }
}
