import 'package:get_it/get_it.dart';

import '../manager/category_manager/category_manager.dart';
import '../manager/category_manager/category_manager_impl.dart';
import '../use_case/auth/sign_in_with_email_and_password_use_case.dart';
import '../use_case/auth/sign_in_with_email_and_password_use_case_impl.dart';
import '../use_case/auth/sign_out_use_case.dart';
import '../use_case/auth/sign_out_use_case_impl.dart';
import '../use_case/auth/sign_up_with_email_and_password_use_case.dart';
import '../use_case/auth/sign_up_with_email_and_password_use_case_impl.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  _registerUseCases();
  _registerManagers();
}

T get<T extends Object>() {
  return serviceLocator.get<T>();
}

void _registerUseCases() {
  serviceLocator.registerFactory<SignInWithEmailAndPasswordUseCase>(
    () => SignInWithEmailAndPasswordUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SignUpWithEmailAndPasswordUseCase>(
    () => SignUpWithEmailAndPasswordUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<SignOutUseCase>(
    () => SignOutUseCaseImpl(
      serviceLocator(),
    ),
  );
}

void _registerManagers() {
  serviceLocator.registerLazySingleton<CategoryManager>(
    () => CategoryManagerImpl(),
  );
}
