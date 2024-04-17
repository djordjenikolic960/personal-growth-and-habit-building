import 'shared_preferences_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManagerImpl implements SharedPreferencesManager {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> get sharedPreferences async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  /* @override
  Future<void> saveString(String key, String value) async {
    final prefsInstance = await sharedPreferences;
    await prefsInstance.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    final prefsInstance = await sharedPreferences;
    return prefsInstance.getString(key);
  }

  @override
  Future<bool> getBool(String key) async {
    final prefsInstance = await sharedPreferences;
    return prefsInstance.getBool(key) ?? false;
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    final prefsInstance = await sharedPreferences;
    await prefsInstance.setBool(key, value);
  }
*/
  @override
  Future<void> save<T>(String key, T value) async {
    final prefs = await sharedPreferences;

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      throw ArgumentError('Unsupported type');
    }
  }

  @override
  Future<T?> get<T>(String key) async {
    final prefs = await sharedPreferences;

    Object? value = prefs.get(key);
    if (value is T) {
      return value;
    }
    return null;
  }
}
