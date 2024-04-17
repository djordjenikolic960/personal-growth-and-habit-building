import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constant/constant.dart';
import '../../../domain/use_case/onboarding/complete_onboarding_use_case.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final CompleteOnboardingUseCase _completeOnboardingUseCase;

  OnBoardingBloc(this._completeOnboardingUseCase)
      : super(PageChanged(Constant.zero.toInt())) {
    on<OnPageChange>(_onPageChange);
    on<GetStarted>(_onGetStarted);
  }

  FutureOr<void> _onPageChange(
    final OnPageChange event,
    final Emitter<OnBoardingState> emit,
  ) {
    emit(PageChanged(event.page));
  }

  FutureOr<void> _onGetStarted(
    final GetStarted event,
    final Emitter<OnBoardingState> emit,
  ) async {
    await _completeOnboardingUseCase.complete();
    emit(OnGetStarted());
  }
}
