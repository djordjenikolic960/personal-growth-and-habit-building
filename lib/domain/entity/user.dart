import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String name;

  const User({
    required this.uid,
    required this.name,
    required this.email,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        name,
      ];
}
