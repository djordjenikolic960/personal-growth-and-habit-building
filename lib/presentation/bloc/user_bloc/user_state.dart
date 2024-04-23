import 'package:equatable/equatable.dart';

import '../../../domain/entity/user.dart';

abstract interface class UserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserIsLoaded extends UserState {
  final User? user;

  UserIsLoaded({
    required this.user,
  });

  @override
  List<Object?> get props => [user];
}

class UserLoggedOut extends UserState {}
