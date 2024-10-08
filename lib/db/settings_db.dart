import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


//テーマモード
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

class ThemePreferences {
  static const _themeKey = 'themeMode';

  // テーマの保存
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_themeKey, themeMode.index);
  }

  // テーマの読み込み
  Future<ThemeMode> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? 0;
    return ThemeMode.values[themeIndex];
  }
}
//
// //ユーザー情報
// class UserInfo {
//   static const _emailKey = 'email';
//   static const _userNameKey = 'userName';
//   static const _yearKey = 'year';
//
//   Future<void> saveUserInfo(String email, String userName, int year) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_emailKey, email);
//     await prefs.setString(_userNameKey, userName);
//     await prefs.setInt(_yearKey, year);
//   }
// }