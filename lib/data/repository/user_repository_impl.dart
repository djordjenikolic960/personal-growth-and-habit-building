import '../../domain/repository/user_repository.dart';
import '../manager/shared_preferences_manager.dart';

class UserRepositoryImpl implements UserRepository {
  final SharedPreferencesManager _sharedPreferencesManager;

  UserRepositoryImpl(this._sharedPreferencesManager);

  @override
  Future<void> saveUserName(final String name) async {
    await _sharedPreferencesManager.saveString("userName", name);
  }

  @override
  Future<String?> getUserName(String key) async {
   await _sharedPreferencesManager.getString(key);
  }



}
