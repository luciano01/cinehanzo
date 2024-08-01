import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static SharedPreferences? _sharedPreferences;

  /// Initialize the SharedPreferences
  static Future<SharedPreferences> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  static Future<bool> setFirstTimeAccess(String key, bool value) async {
    return await _sharedPreferences!.setBool(key, value);
  }

  static Future<bool> getFirstTimeAccess(String key) async {
    return _sharedPreferences!.getBool(key) ?? false;
  }
}
