import '../../domain/repository/user_repository.dart';
import '../manager/shared_preferences_manager.dart';

class UserRepositoryImpl implements UserRepository {
  final SharedPreferencesManager _sharedPreferencesManager;

  UserRepositoryImpl(this._sharedPreferencesManager);

  @override
  Future<void> saveUserName(final String name) async {
    await _sharedPreferencesManager.save<String>("userName", name);
  }

  @override
  Future<String?> getUserName(String key) async {
    return await _sharedPreferencesManager.get<String?>(key);
  }
}
