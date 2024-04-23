import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/onboarding/is_onboarding_completed_use_case.dart';
import 'app_config_event.dart';
import 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final IsOnboardingCompletedUseCase isOnboardingCompletedUseCase;

  AppConfigBloc(this.isOnboardingCompletedUseCase) : super(AppConfigInitial()) {
    on<CheckOnboardingCompletion>(_emitOnboardingCompletion);
  }

  FutureOr<void> _emitOnboardingCompletion(
    CheckOnboardingCompletion event,
    Emitter<AppConfigState> emit,
  ) async {
    final isCompleted = await isOnboardingCompletedUseCase.isCompleted();
    emit(OnboardingCompletionResult(isCompleted));
  }
}
