// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthImpl _$$AuthImplFromJson(Map<String, dynamic> json) => _$AuthImpl(
      year: (json['year'] as num?)?.toInt(),
      email: json['email'] as String?,
      obscureText: json['obscureText'] as bool? ?? true,
      passwordForCreate1: json['passwordForCreate1'] as String?,
      passwordForCreate2: json['passwordForCreate2'] as String?,
      passwordForLogin: json['passwordForLogin'] as String?,
      errorMessage: json['errorMessage'] as String?,
      userName: json['userName'] as String?,
      checkAccountExistLimit:
          (json['checkAccountExistLimit'] as num?)?.toInt() ?? 5,
      checkPasswordLimit: (json['checkPasswordLimit'] as num?)?.toInt() ?? 5,
    );

Map<String, dynamic> _$$AuthImplToJson(_$AuthImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'email': instance.email,
      'obscureText': instance.obscureText,
      'passwordForCreate1': instance.passwordForCreate1,
      'passwordForCreate2': instance.passwordForCreate2,
      'passwordForLogin': instance.passwordForLogin,
      'errorMessage': instance.errorMessage,
      'userName': instance.userName,
      'checkAccountExistLimit': instance.checkAccountExistLimit,
      'checkPasswordLimit': instance.checkPasswordLimit,
    };
