import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/habit.dart';

@immutable
abstract interface class CreateHabitEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SaveHabit extends CreateHabitEvent {
  SaveHabit();
}

class UpdateHabit extends CreateHabitEvent {
  final String? title;
  final List<bool>? daysOfWeek;
  final bool? reminderOn;
  final String? reminderTime;

  UpdateHabit(
      {this.title, this.daysOfWeek, this.reminderOn, this.reminderTime});

  @override
  List<Object?> get props => [
        title,
        daysOfWeek,
        reminderOn,
        reminderTime,
      ];
}
