import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/user.dart';
import '../bloc/user_bloc/user_bloc.dart';
import '../bloc/user_bloc/user_state.dart';

extension BuildContextUserExt on BuildContext {
  User? get watchCurrentUser {
    final userState = watch<UserBloc>().state;
    if (userState is! UserIsLoaded) {
      return null;
    }

    return userState.user;
  }

  User? get getCurrentUser {
    final userState = read<UserBloc>().state;
    if (userState is! UserIsLoaded) {
      return null;
    }

    return userState.user;
  }
}
