import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


//通知設定のProvider
final notificationSettingProvider = StateNotifierProvider<NotificationSettingNotifier, bool>((ref) {
  return NotificationSettingNotifier();
});

class NotificationSettingNotifier extends StateNotifier<bool> {
  NotificationSettingNotifier() : super(false) {
    _load();
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final isNotification = prefs.getBool('isNotification') ?? false;
    state = isNotification;
  }

  Future<void> toggle() async {
    final prefs = await SharedPreferences.getInstance();
    state = !state;
    await prefs.setBool('isNotification', state);
  }
}

//テーマ設定のProvider
