// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationContentImpl _$$NotificationContentImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationContentImpl(
      id: json['id'] as String,
      type: const NotificationTypeEnumConverter()
          .fromJson(json['type'] as String),
      headerImagePath: json['headerImagePath'] as String,
      title: json['title'] as String,
      contents: json['contents'] as String,
      sendAt: const DateTimeConverter().fromJson(json['sendAt'] as String),
      savedAt: const DateTimeConverter().fromJson(json['savedAt'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$NotificationContentImplToJson(
        _$NotificationContentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const NotificationTypeEnumConverter().toJson(instance.type),
      'headerImagePath': instance.headerImagePath,
      'title': instance.title,
      'contents': instance.contents,
      'sendAt': const DateTimeConverter().toJson(instance.sendAt),
      'savedAt': const DateTimeConverter().toJson(instance.savedAt),
      'isRead': instance.isRead,
    };
