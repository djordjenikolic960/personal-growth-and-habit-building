import 'shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManagerImpl implements SharedPreferencesManager {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> get sharedPreferences async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  @override
  Future<void> saveString(String key, String value) async {
    final prefsInstance = await sharedPreferences;
    await prefsInstance.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    final prefsInstance = await sharedPreferences;
    return prefsInstance.getString(key);
  }
}
