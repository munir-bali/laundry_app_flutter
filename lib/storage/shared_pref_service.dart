import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static const String _isLoginKey = 'isLogin';

  static Future<void> saveLoginStatus(
    bool value,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();
    await prefs.setBool(
      _isLoginKey,
      value,
    );
  }

  static Future<bool> getLoginStatus() async {
    final prefs =
        await SharedPreferences.getInstance();
    return prefs.getBool(_isLoginKey) ??
        false;
  }

  static Future<void> removeLoginStatus() async {
    final prefs =
        await SharedPreferences.getInstance();
    await prefs.remove(_isLoginKey);
  }
}
