abstract interface class SharedPreferencesManager {
  Future<void> saveString(String key, String value);

  Future<String?> getString(String key);
}
