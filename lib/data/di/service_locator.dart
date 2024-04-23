import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../domain/repository/auth_repository.dart';
import '../../domain/repository/preferences_repository.dart';
import '../../domain/repository/user_repository.dart';
import '../converters/user_converter.dart';
import '../manager/auth_manager.dart';
import '../manager/auth_manager_impl.dart';
import '../manager/shared_preferences_manager.dart';
import '../manager/shared_preferences_manager_impl.dart';
import '../repository/auth_repository_impl.dart';
import '../repository/preferences_repository_impl.dart';
import '../repository/user_repository_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  ///_registerLocalDatabase();
  ///_registerNetworkClient();
  ///_registerLocalStorage();
  _registerConverters();

  ///_registerHelpers();
  _registerExternalServices();
  _registerManagers();
  _registerRepositories();
}

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

void _registerConverters() {
  serviceLocator.registerLazySingleton<UserConverter>(
    () => UserConverter(),
  );
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

  serviceLocator.registerLazySingleton<SharedPreferencesManager>(
    () => SharedPreferencesManagerImpl(),
  );
}

void _registerRepositories() {
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      serviceLocator(),
      serviceLocator(),
      serviceLocator(),
    ),
  );

  serviceLocator.registerLazySingleton<PreferencesRepository>(
    () => PreferencesRepositoryImpl(
      serviceLocator(),
    ),
  );
}
