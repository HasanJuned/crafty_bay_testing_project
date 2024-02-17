import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/screens/auth_screens/emai_verification_screen.dart';

class AuthController {
  static String? _accessToken;
  static String? _readProfile;
  static String? themeMode;

  static String? get accessToken => _accessToken;
  static String? get readProfile => _readProfile;

  /// set user token
  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessToken = token;
  }

  static Future<void> setReadProfile(String read_profile) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('read_profile', read_profile);
    _readProfile = read_profile;
  }

  /// get user token
  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    _accessToken = sharedPreferences.getString('access_token');
  }

  static Future<void> getReadProfile() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    _readProfile = sharedPreferences.getString('read_profile');
    print('tg $_readProfile');
  }

  static Future<void> clearUserInfo() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.clear().then((value) => Get.offAll(const EmailVerificationScreen()));

  }

  /// user already logged in or not
  static bool isLoggedIn() {
    return _accessToken != null;
  }

  static Future<void> setThemeMode(String ans) async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    await sharedPreferences.setString('theme_mode', ans);
    themeMode = ans;
  }

  static Future<void> getTheme() async {
    final SharedPreferences sharedPreferences =
    await SharedPreferences.getInstance();
    themeMode = sharedPreferences.getString('theme_mode');
  }





}