// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../models/auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      year: (json['year'] as num?)?.toInt(),
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      confirmVerifyEmail: json['confirmVerifyEmail'] as bool? ?? false,
      limit: (json['limit'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'confirmVerifyEmail': instance.confirmVerifyEmail,
      'limit': instance.limit,
    };
