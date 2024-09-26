// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      type: const NotificationTypeEnumConverter()
          .fromJson(json['type'] as String),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      content: json['content'] as String,
      createdAt:
          const DateTimeConverter().fromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'type': const NotificationTypeEnumConverter().toJson(instance.type),
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
