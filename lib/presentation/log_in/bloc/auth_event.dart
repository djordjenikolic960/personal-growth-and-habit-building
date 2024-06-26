import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract interface class AuthEvent extends Equatable {}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(
    this.email,
    this.password,
  );

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignUpRequested(
    this.email,
    this.password,
    this.name,
  );

  @override
  List<Object?> get props => [
        email,
        password,
        name,
      ];
}
