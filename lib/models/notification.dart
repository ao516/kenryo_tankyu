import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenryo_tankyu/models/models.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const Notification._();

  const factory Notification({
    required int id,
    @NotificationTypeEnumConverter() required NotificationType type,
    required String headerImageUrl,
    required String title,
    required String contents,
    @DateTimeConverter() required DateTime sendAt,
    @DateTimeConverter() required DateTime savedAt,
    required bool isRead,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
  
  factory Notification.fromSQLite(Map<String,dynamic> json) {
    final mutableJson = Map<String,dynamic>.from(json);
    mutableJson['isRead'] = mutableJson['isRead'] == 1;
    final notification = Notification.fromJson(mutableJson);
    return notification;
  }

  factory Notification.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final mutableJson = Map<String,dynamic>.from(data);
    mutableJson['isRead'] = false;
    mutableJson['savedAt'] = DateTime.now();
    final notification = Notification.fromJson(mutableJson);
    return notification;
  }

  Map<String,dynamic> toSQLite() {
    final json = toJson();
    json['isRead'] = json['isRead'] ? 1 : 0;
    return json;
  }
}

enum NotificationType {
  system(icon: Icons.abc),
  update(icon: Icons.update),
  info(icon: Icons.info),
  warning(icon: Icons.warning),
  other(icon: Icons.more_horiz),;

  final IconData icon;
  const NotificationType({required this.icon});
}

class NotificationTypeEnumConverter
    implements JsonConverter<NotificationType, String> {
  const NotificationTypeEnumConverter();

  @override
  NotificationType fromJson(String json) {
    final NotificationType notificationType =
        NotificationType.values.firstWhere(
      (element) => element.name == json,
      orElse: () => NotificationType.other,
    );
    return notificationType;
  }

  @override
  String toJson(NotificationType object) {
    return object.name;
  }
}
