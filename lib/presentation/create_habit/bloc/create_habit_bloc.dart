import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/habit.dart';
import '../../../domain/use_case/habit/insert_habit_user_case.dart';
import 'create_habit_event.dart';

import 'create_habit_state.dart';

class CreateHabitBloc extends Bloc<CreateHabitEvent, CreateHabitState> {
  Habit currentHabit;
  final InsertHabitUseCase _insertHabitUseCase;

  CreateHabitBloc(
    this._insertHabitUseCase,
  )   : currentHabit = Habit.empty(),
        super(CreateHabitInitial()) {
    on<SaveHabit>(_emitCreateHabit);
    on<UpdateHabit>(_emitUpdateHabit);
  }

  FutureOr<void> _emitCreateHabit(
    SaveHabit event,
    Emitter<CreateHabitState> emit,
  ) async {
    try {
      await _insertHabitUseCase.insert(currentHabit);
      emit(CreateHabitSuccessful());
    } catch (e) {}
  }

  FutureOr<void> _emitUpdateHabit(
    UpdateHabit event,
    Emitter<CreateHabitState> emit,
  ) {
    currentHabit = currentHabit.copyWith(
      title: event.title ?? currentHabit.title,
      daysOfWeek: event.daysOfWeek ?? currentHabit.daysOfWeek,
      reminderOn: event.reminderOn ?? currentHabit.reminderOn,
      reminderTime: event.reminderTime ?? currentHabit.reminderTime,
    );
    emit(HabitUpdated(currentHabit));
  }
}
