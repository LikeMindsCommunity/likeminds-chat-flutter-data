import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferenceService {
  late final SharedPreferences _sharedPreferences;

  LocalPreferenceService() {
    _init();
  }

  Future<void> _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  Future<void> setDouble(String key, double value) async {
    await _sharedPreferences.setDouble(key, value);
  }

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
