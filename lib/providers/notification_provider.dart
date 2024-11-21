//通知の内容をfirestoreから受け取るfuture provider
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenryo_tankyu/db/notification_db.dart';
import 'package:kenryo_tankyu/models/models.dart';

final notificationProvider = FutureProvider.autoDispose<List<Notification>>(
  (ref) async {
    //もしキャッシュがあれば、それを返す
    final data = await NotificationDbController.read(0);
    if (data != null) {
      return data;
    } else {
      final snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .orderBy('sendAt', descending: true)
          .limit(4)
          .get(const GetOptions(source: Source.server));
      return snapshot.docs
          .map((doc) => Notification.fromJson(doc as Map<String, dynamic>))
          .toList();
    }
  },
);
