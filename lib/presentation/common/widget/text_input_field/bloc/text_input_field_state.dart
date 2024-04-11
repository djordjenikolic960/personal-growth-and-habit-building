import 'package:equatable/equatable.dart';

class InputFieldState extends Equatable {
  final bool hasFocus;
  final bool isNotEmpty;
  final bool isPasswordVisible;

  const InputFieldState({
    this.hasFocus = false,
    this.isNotEmpty = false,
    this.isPasswordVisible = false,
  });

  InputFieldState copyWith({
    bool? hasFocus,
    bool? isNotEmpty,
    bool? isPasswordVisible,
  }) {
    return InputFieldState(
      hasFocus: hasFocus ?? this.hasFocus,
      isNotEmpty: isNotEmpty ?? this.isNotEmpty,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  @override
  List<Object?> get props => [
        hasFocus,
        isNotEmpty,
        isPasswordVisible,
      ];
}
