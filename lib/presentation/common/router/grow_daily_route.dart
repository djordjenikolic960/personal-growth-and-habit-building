import '../../../common/constant/constant.dart';
import '../../challenges/challenges_screen.dart';
import '../../choose_category/choose_category_screen.dart';
import '../../home/home_screen.dart';
import '../../log_in/login_screen.dart';
import '../../progress/progress_screen.dart';
import '../../settings/settings_screen.dart';
import '../../sign_up/sign_up_screen.dart';
import '../bottom_navigation/bottom_navigation_screen.dart';

enum GrowDailyRoute {
  logIn(LoginScreen),
  signUp(SignUpScreen),
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
    if (this == GrowDailyRoute.logIn) {
      return Constant.slash;
    } else {
      return "${Constant.slash}$routerName";
    }
  }
}
