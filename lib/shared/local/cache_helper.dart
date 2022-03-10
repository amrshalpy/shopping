import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required dynamic value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static getData({
    required String key,
  }) {
    return sharedPreferences.getString(key);
  }
}
