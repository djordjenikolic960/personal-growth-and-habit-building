import '../../common/constant/constant.dart';
import '../../domain/entity/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

class UserConverter {
  User toEntity(fb_auth.User user) => User(
        uid: user.uid,
        name: user.displayName ?? Constant.emptyString,
        email: user.email ?? Constant.emptyString,
      );
}
