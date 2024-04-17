import '../../domain/repository/preferences_repository.dart';
import '../manager/shared_preferences_manager.dart';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferencesManager _sharedPreferencesManager;

  PreferencesRepositoryImpl(this._sharedPreferencesManager);

  @override
  Future<T?> get<T>(String key) {
    return _sharedPreferencesManager.get<T>(key);
  }

  @override
  Future<void> save<T>(String key, T value) async {
    await _sharedPreferencesManager.save<T>(key, value);
  }
}
