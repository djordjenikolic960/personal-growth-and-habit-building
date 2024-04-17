import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract interface class OnBoardingState extends Equatable {}

class PageChanged extends OnBoardingState {
  final int page;

  PageChanged(this.page);

  @override
  List<Object?> get props => [page];
}

class OnGetStarted extends OnBoardingState {
  @override
  List<Object?> get props => [];
}
