//通知の内容をfirestoreから受け取るfuture provider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/db/notification_db.dart';
import 'package:kenryo_tankyu/models/models.dart';

class NotificationNotifier extends StateNotifier<List<NotificationContent>> {
  NotificationNotifier() : super([]) {
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    final data = await NotificationDbController.read(0);
    if (data != null) {
      state = data;
    } else {
      final snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .orderBy('sendAt', descending: true)
          .limit(4)
          .get(const GetOptions(source: Source.server));
      state = snapshot.docs
          .map((doc) => NotificationContent.fromJson(doc.data()))
          .toList();
    }
  }

  Future<void> markAsRead(int id) async {
    await NotificationDbController.markAsRead(id);
    state = state.map((notification) {
      if (notification.id == id) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();
  }
}

final notificationProvider = StateNotifierProvider<NotificationNotifier, List<NotificationContent>>(
  (ref) => NotificationNotifier(),
);
