import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract interface class AppConfigEvent extends Equatable {}

class CheckOnboardingCompletion extends AppConfigEvent {
  @override
  List<Object?> get props => [];
}
