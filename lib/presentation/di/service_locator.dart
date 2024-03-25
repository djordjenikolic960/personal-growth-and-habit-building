import 'package:get_it/get_it.dart';
import '../common/bottom_navigation/bloc/bottom_navigation_bloc.dart';
import '../common/router/grow_daily_router.dart';
import '../common/router/grow_daily_router_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  _registerBlocs();
  _registerRouter();
}

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

void _registerBlocs() {
  serviceLocator.registerFactory<BottomNavigationBloc>(
    () => BottomNavigationBloc(),
  );
}

void _registerRouter() {
  serviceLocator.registerLazySingleton<GrowDailyRouter>(
    () => GrowDailyRouterImpl.defaultRouter(),
  );
}
