import 'package:get_it/get_it.dart';

import '../manager/category_manager/category_manager.dart';
import '../manager/category_manager/category_manager_impl.dart';
import '../use_case/auth/get_user_name_use_case.dart';
import '../use_case/auth/get_user_name_use_case_impl.dart';
import '../use_case/auth/get_user_stream_use_case.dart';
import '../use_case/auth/get_user_stream_use_case_impl.dart';
import '../use_case/auth/save_user_name_use_case.dart';
import '../use_case/auth/save_user_name_use_case_impl.dart';
import '../use_case/auth/sign_in_with_email_and_password_use_case.dart';
import '../use_case/auth/sign_in_with_email_and_password_use_case_impl.dart';
import '../use_case/auth/sign_out_use_case.dart';
import '../use_case/auth/sign_out_use_case_impl.dart';
import '../use_case/auth/sign_up_with_email_and_password_use_case.dart';
import '../use_case/auth/sign_up_with_email_and_password_use_case_impl.dart';
import '../use_case/habit/get_all_habits_as_stream_use_case.dart';
import '../use_case/habit/get_all_habits_as_stream_use_case_impl.dart';
import '../use_case/habit/get_all_habits_use_case.dart';
import '../use_case/habit/get_all_habits_use_case_impl.dart';
import '../use_case/habit/insert_habit_use_case_impl.dart';
import '../use_case/habit/insert_habit_user_case.dart';
import '../use_case/habit/update_habit_use_case.dart';
import '../use_case/habit/update_habit_use_case_impl.dart';
import '../use_case/onboarding/complete_onboarding_use_case.dart';
import '../use_case/onboarding/complete_onboarding_use_case_impl.dart';
import '../use_case/onboarding/is_onboarding_completed_use_case.dart';
import '../use_case/onboarding/is_onboarding_completed_use_case_impl.dart';

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

  serviceLocator.registerFactory<SaveUserNameUseCase>(
    () => SaveUserUserNameUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetUserNameUseCase>(
    () => GetUserNameUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<IsOnboardingCompletedUseCase>(
    () => IsOnboardingCompletedUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<CompleteOnboardingUseCase>(
    () => CompleteOnboardingUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetUserStreamUseCase>(
    () => GetUserStreamUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<InsertHabitUseCase>(
    () => InsertHabitUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetAllHabitsUseCase>(
    () => GetAllHabitsUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetAllHabitsAsStreamUseCase>(
    () => GetAllHabitsAsStreamUseCaseImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<UpdateHabitUseCase>(
    () => UpdateHabitUseCaseImpl(
      serviceLocator(),
    ),
  );
}

void _registerManagers() {
  serviceLocator.registerLazySingleton<CategoryManager>(
    () => CategoryManagerImpl(),
  );
}
