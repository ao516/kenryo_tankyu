import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kenryo_tankyu/models/models.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const Notification._();

  const factory Notification({
    @NotificationTypeEnumConverter() required NotificationType type,
    required String title,
    required String subtitle,
    required String content,
    @DateTimeConverter() required DateTime createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
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
