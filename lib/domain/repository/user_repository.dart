import '../entity/user.dart';

abstract interface class UserRepository {
  Future<void> saveUserName(final String name);

  Future<String?> getUserName(final String key);

  Stream<User?> get user;
}
