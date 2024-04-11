import 'package:flutter_bloc/flutter_bloc.dart';
import 'text_input_field_state.dart';
import 'text_input_field_event.dart';

class InputFieldBloc extends Bloc<InputFieldEvent, InputFieldState> {
  InputFieldBloc() : super(const InputFieldState()) {
    on<InputFieldFocusChanged>(_onInputFieldFocusChanged);
    on<InputFieldContentChanged>(_onInputFieldContentChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
  }

  void _onInputFieldFocusChanged(
    final InputFieldFocusChanged event,
    final Emitter<InputFieldState> emit,
  ) {
    emit(state.copyWith(
      hasFocus: event.hasFocus,
    ));
  }

  void _onInputFieldContentChanged(
    final InputFieldContentChanged event,
    final Emitter<InputFieldState> emit,
  ) {
    emit(state.copyWith(
      isNotEmpty: event.content.isNotEmpty,
    ));
  }

  void _onTogglePasswordVisibility(
    final TogglePasswordVisibility event,
    final Emitter<InputFieldState> emit,
  ) {
    emit(state.copyWith(
      isPasswordVisible: !state.isPasswordVisible,
    ));
  }
}
