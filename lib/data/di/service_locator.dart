import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/auth_repository.dart';
import '../manager/auth_manager.dart';
import '../manager/auth_manager_impl.dart';
import '../repository/auth_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  ///_registerLocalDatabase();
  ///_registerNetworkClient();
  ///_registerLocalStorage();
  ///_registerConverters();
  ///_registerHelpers();
  _registerExternalServices();
  _registerManagers();
  _registerRepositories();
}

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

void _registerExternalServices() {
  serviceLocator
      .registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}

void _registerManagers() {
  serviceLocator.registerLazySingleton<AuthManager>(
    () => AuthManagerImpl(
      serviceLocator(),
    ),
  );
}

void _registerRepositories() {
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );
}
