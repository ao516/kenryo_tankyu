// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      affiliation: _$JsonConverterFromJson<String, Affiliation>(
          json['affiliation'], const AffiliationConverter().fromJson),
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      confirmVerifyEmail: json['confirmVerifyEmail'] as bool? ?? false,
      limit: (json['limit'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) =>
    <String, dynamic>{
      'affiliation': _$JsonConverterToJson<String, Affiliation>(
          instance.affiliation, const AffiliationConverter().toJson),
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'confirmVerifyEmail': instance.confirmVerifyEmail,
      'limit': instance.limit,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
