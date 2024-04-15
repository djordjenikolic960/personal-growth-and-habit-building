import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_case/auth/save_user_name_use_case.dart';
import '../../../domain/use_case/auth/sign_in_with_email_and_password_use_case.dart';
import '../../../domain/use_case/auth/sign_out_use_case.dart';
import '../../../domain/use_case/auth/sign_up_with_email_and_password_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;
  final SaveUserNameUseCase _saveUserNameUseCase;

  AuthBloc(
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signOutUseCase,
    this._saveUserNameUseCase,
  ) : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _signInWithEmailAndPasswordUseCase.signIn(
          event.email,
          event.password,
        );
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        await _signUpWithEmailAndPasswordUseCase.signUp(
          event.email,
          event.password,
        );
        await _saveUserNameUseCase.save(event.name);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
