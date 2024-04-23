import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entity/user.dart';
import '../../../domain/use_case/auth/get_user_stream_use_case.dart';
import '../../../domain/use_case/auth/sign_out_use_case.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final SignOutUseCase signOutUseCase;
  final GetUserStreamUseCase getUserStreamUseCase;

  UserBloc(
    this.signOutUseCase,
    this.getUserStreamUseCase,
  ) : super(UserInitial()) {
    _load();
    on<UserLoaded>(_emitUserLoaded);
    on<LogOut>(_emitLogOut);
  }

  StreamSubscription<User?>? _userSubscription;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  void _load() {
    _userSubscription = getUserStreamUseCase.get().listen((user) {
      add(UserLoaded(user));
    });
  }

  FutureOr<void> _emitUserLoaded(
    UserLoaded event,
    Emitter<UserState> emit,
  ) {
    emit(UserIsLoaded(user: event.user));
    if (event.user != null) {
      // notificationsRepository.addFcmToken();
      // analyticsRepository.setUser(user);
    }
  }

  FutureOr<void> _emitLogOut(
    LogOut event,
    Emitter<UserState> emit,
  ) async {
    await signOutUseCase.signOut();
    emit(UserLoggedOut());
  }
}
