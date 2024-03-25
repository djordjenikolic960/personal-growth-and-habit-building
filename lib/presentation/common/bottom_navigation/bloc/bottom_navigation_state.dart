import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../screen.dart';

@immutable
abstract interface class BottomNavigationState extends Equatable {}

class BottomNavigationSelectedScreen extends BottomNavigationState {
  final Screen screen;

  BottomNavigationSelectedScreen(this.screen);

  @override
  List<Object?> get props => [screen];
}
