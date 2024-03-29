import 'package:get_it/get_it.dart';

import '../manager/category_manager/category_manager.dart';
import '../manager/category_manager/category_manager_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  _registerManagers();
}

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

void _registerManagers() {
  serviceLocator.registerLazySingleton<CategoryManager>(
    () => CategoryManagerImpl(),
  );
}
