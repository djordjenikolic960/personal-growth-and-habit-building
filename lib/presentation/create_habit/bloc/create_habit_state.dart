import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/habit.dart';

@immutable
abstract interface class CreateHabitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateHabitInitial extends CreateHabitState {}

class CreateHabitSuccessful extends CreateHabitState {}

class HabitUpdated extends CreateHabitState {
  final Habit habit;

  HabitUpdated(this.habit);

  @override
  List<Object?> get props => [habit];
}
