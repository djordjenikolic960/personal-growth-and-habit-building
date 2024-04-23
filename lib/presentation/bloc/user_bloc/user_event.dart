import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entity/user.dart';

@immutable
abstract interface class UserEvent extends Equatable {}

class UserLoaded extends UserEvent {
  final User? user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class LogOut extends UserEvent {
  @override
  List<Object?> get props => [];
}
