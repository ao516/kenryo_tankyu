import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


//通知設定のProvider
final notificationSettingProvider = NotifierProvider<NotificationSettingNotifier, bool>(
  NotificationSettingNotifier.new,
);

class NotificationSettingNotifier extends Notifier<bool> {
  @override
  bool build() {
    _load();
    return false;
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
