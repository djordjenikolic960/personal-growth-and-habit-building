import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/habit.dart';

@immutable
abstract interface class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStateInitial extends HomeState {}

class FetchHabitSuccess extends HomeState {
  final List<Habit> habit;
  final DateTime selectedDate;

  FetchHabitSuccess(
    this.habit,
    this.selectedDate,
  );

  @override
  List<Object?> get props => [
        habit,
        selectedDate,
      ];
}
