import 'package:equatable/equatable.dart';

abstract interface class InputFieldEvent extends Equatable {}

class InputFieldFocusChanged extends InputFieldEvent {
  final bool hasFocus;

  InputFieldFocusChanged(this.hasFocus);

  @override
  List<Object?> get props => [hasFocus];
}

class InputFieldContentChanged extends InputFieldEvent {
  final String content;

  InputFieldContentChanged(this.content);

  @override
  List<Object?> get props => [content];
}

class TogglePasswordVisibility extends InputFieldEvent {
  @override
  List<Object?> get props => [];
}
