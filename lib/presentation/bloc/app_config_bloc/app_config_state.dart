import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract interface class AppConfigState extends Equatable {}

class AppConfigInitial extends AppConfigState {
  @override
  List<Object?> get props => [];
}

class OnboardingCompletionResult extends AppConfigState {
  final bool isCompleted;

  OnboardingCompletionResult(this.isCompleted);

  @override
  List<Object?> get props => [
        isCompleted,
      ];
}
