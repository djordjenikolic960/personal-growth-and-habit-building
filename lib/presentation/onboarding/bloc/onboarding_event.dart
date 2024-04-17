import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract interface class OnBoardingEvent extends Equatable {}

class OnPageChange extends OnBoardingEvent {
  final int page;

  OnPageChange(this.page);

  @override
  List<Object?> get props => [page];
}

class GetStarted extends OnBoardingEvent {
  @override
  List<Object?> get props => [];
}
