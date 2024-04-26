import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/habit.dart';

@immutable
abstract interface class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class EmitHabits extends HomeEvent {
  final List<Habit> habits;
  final DateTime selectedDate;

  EmitHabits(
    this.habits,
    this.selectedDate,
  );

  @override
  List<Object?> get props => [
        habits,
        selectedDate,
      ];
}

class InitializeHabitsStream extends HomeEvent {
  final DateTime date;

  InitializeHabitsStream({DateTime? date}) : date = date ?? DateTime.now();

  @override
  List<Object?> get props => [date];
}

class SelectDate extends HomeEvent {
  final DateTime date;

  SelectDate(this.date);

  @override
  List<Object?> get props => [date];
}

class UpdateHabit extends HomeEvent {
  final Habit habit;
  final bool isCompleted;

  UpdateHabit(
    this.habit,
    this.isCompleted,
  );

  @override
  List<Object?> get props => [
        habit,
        isCompleted,
        habit.logs,
      ];
}
