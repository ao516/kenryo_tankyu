// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: (json['id'] as num).toInt(),
      type: const NotificationTypeEnumConverter()
          .fromJson(json['type'] as String),
      headerImageUrl: json['headerImageUrl'] as String,
      title: json['title'] as String,
      contents: json['contents'] as String,
      sendAt: const DateTimeConverter().fromJson(json['sendAt'] as String),
      savedAt: const DateTimeConverter().fromJson(json['savedAt'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': const NotificationTypeEnumConverter().toJson(instance.type),
      'headerImageUrl': instance.headerImageUrl,
      'title': instance.title,
      'contents': instance.contents,
      'sendAt': const DateTimeConverter().toJson(instance.sendAt),
      'savedAt': const DateTimeConverter().toJson(instance.savedAt),
      'isRead': instance.isRead,
    };
