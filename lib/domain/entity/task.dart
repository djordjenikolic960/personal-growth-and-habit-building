import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String text;

  const Task(this.text);

  @override
  List<Object?> get props => [text];
}
