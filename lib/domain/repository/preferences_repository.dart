abstract interface class PreferencesRepository {
  Future<void> save<T>(String key, T value);

  Future<T?> get<T>(String key);
}
