import '../../domain/entity/user.dart';
import '../../domain/repository/user_repository.dart';
import '../converters/user_converter.dart';
import '../manager/auth_manager.dart';
import '../manager/shared_preferences_manager.dart';

class UserRepositoryImpl implements UserRepository {
  final SharedPreferencesManager _sharedPreferencesManager;
  final AuthManager _authManager;
  final UserConverter _userConverter;

  UserRepositoryImpl(
    this._sharedPreferencesManager,
    this._authManager,
    this._userConverter,
  );

  @override
  Future<void> saveUserName(final String name) async {
    await _sharedPreferencesManager.save<String>("userName", name);
  }

  @override
  Future<String?> getUserName(String key) async {
    return await _sharedPreferencesManager.get<String?>(key);
  }

  @override
  Stream<User?> get user => _authManager
      .authStateChanges()
      .map((user) => user != null ? _userConverter.toEntity(user) : null);
}
