// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return _Auth.fromJson(json);
}

/// @nodoc
mixin _$Auth {
  int? get year => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  String? get passwordForCreate1 => throw _privateConstructorUsedError;
  String? get passwordForCreate2 => throw _privateConstructorUsedError;
  String? get passwordForLogin => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  int get checkAccountExistLimit => throw _privateConstructorUsedError;
  int get checkPasswordLimit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCopyWith<Auth> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCopyWith<$Res> {
  factory $AuthCopyWith(Auth value, $Res Function(Auth) then) =
      _$AuthCopyWithImpl<$Res, Auth>;
  @useResult
  $Res call(
      {int? year,
      String? email,
      bool obscureText,
      String? passwordForCreate1,
      String? passwordForCreate2,
      String? passwordForLogin,
      String? errorMessage,
      String? userName,
      int checkAccountExistLimit,
      int checkPasswordLimit});
}

/// @nodoc
class _$AuthCopyWithImpl<$Res, $Val extends Auth>
    implements $AuthCopyWith<$Res> {
  _$AuthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? email = freezed,
    Object? obscureText = null,
    Object? passwordForCreate1 = freezed,
    Object? passwordForCreate2 = freezed,
    Object? passwordForLogin = freezed,
    Object? errorMessage = freezed,
    Object? userName = freezed,
    Object? checkAccountExistLimit = null,
    Object? checkPasswordLimit = null,
  }) {
    return _then(_value.copyWith(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordForCreate1: freezed == passwordForCreate1
          ? _value.passwordForCreate1
          : passwordForCreate1 // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordForCreate2: freezed == passwordForCreate2
          ? _value.passwordForCreate2
          : passwordForCreate2 // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordForLogin: freezed == passwordForLogin
          ? _value.passwordForLogin
          : passwordForLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkAccountExistLimit: null == checkAccountExistLimit
          ? _value.checkAccountExistLimit
          : checkAccountExistLimit // ignore: cast_nullable_to_non_nullable
              as int,
      checkPasswordLimit: null == checkPasswordLimit
          ? _value.checkPasswordLimit
          : checkPasswordLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthImplCopyWith<$Res> implements $AuthCopyWith<$Res> {
  factory _$$AuthImplCopyWith(
          _$AuthImpl value, $Res Function(_$AuthImpl) then) =
      __$$AuthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? year,
      String? email,
      bool obscureText,
      String? passwordForCreate1,
      String? passwordForCreate2,
      String? passwordForLogin,
      String? errorMessage,
      String? userName,
      int checkAccountExistLimit,
      int checkPasswordLimit});
}

/// @nodoc
class __$$AuthImplCopyWithImpl<$Res>
    extends _$AuthCopyWithImpl<$Res, _$AuthImpl>
    implements _$$AuthImplCopyWith<$Res> {
  __$$AuthImplCopyWithImpl(_$AuthImpl _value, $Res Function(_$AuthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
    Object? email = freezed,
    Object? obscureText = null,
    Object? passwordForCreate1 = freezed,
    Object? passwordForCreate2 = freezed,
    Object? passwordForLogin = freezed,
    Object? errorMessage = freezed,
    Object? userName = freezed,
    Object? checkAccountExistLimit = null,
    Object? checkPasswordLimit = null,
  }) {
    return _then(_$AuthImpl(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordForCreate1: freezed == passwordForCreate1
          ? _value.passwordForCreate1
          : passwordForCreate1 // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordForCreate2: freezed == passwordForCreate2
          ? _value.passwordForCreate2
          : passwordForCreate2 // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordForLogin: freezed == passwordForLogin
          ? _value.passwordForLogin
          : passwordForLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      checkAccountExistLimit: null == checkAccountExistLimit
          ? _value.checkAccountExistLimit
          : checkAccountExistLimit // ignore: cast_nullable_to_non_nullable
              as int,
      checkPasswordLimit: null == checkPasswordLimit
          ? _value.checkPasswordLimit
          : checkPasswordLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthImpl implements _Auth {
  const _$AuthImpl(
      {this.year,
      this.email,
      this.obscureText = true,
      this.passwordForCreate1,
      this.passwordForCreate2,
      this.passwordForLogin,
      this.errorMessage,
      this.userName,
      this.checkAccountExistLimit = 5,
      this.checkPasswordLimit = 5});

  factory _$AuthImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthImplFromJson(json);

  @override
  final int? year;
  @override
  final String? email;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  final String? passwordForCreate1;
  @override
  final String? passwordForCreate2;
  @override
  final String? passwordForLogin;
  @override
  final String? errorMessage;
  @override
  final String? userName;
  @override
  @JsonKey()
  final int checkAccountExistLimit;
  @override
  @JsonKey()
  final int checkPasswordLimit;

  @override
  String toString() {
    return 'Auth(year: $year, email: $email, obscureText: $obscureText, passwordForCreate1: $passwordForCreate1, passwordForCreate2: $passwordForCreate2, passwordForLogin: $passwordForLogin, errorMessage: $errorMessage, userName: $userName, checkAccountExistLimit: $checkAccountExistLimit, checkPasswordLimit: $checkPasswordLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.passwordForCreate1, passwordForCreate1) ||
                other.passwordForCreate1 == passwordForCreate1) &&
            (identical(other.passwordForCreate2, passwordForCreate2) ||
                other.passwordForCreate2 == passwordForCreate2) &&
            (identical(other.passwordForLogin, passwordForLogin) ||
                other.passwordForLogin == passwordForLogin) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.checkAccountExistLimit, checkAccountExistLimit) ||
                other.checkAccountExistLimit == checkAccountExistLimit) &&
            (identical(other.checkPasswordLimit, checkPasswordLimit) ||
                other.checkPasswordLimit == checkPasswordLimit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      year,
      email,
      obscureText,
      passwordForCreate1,
      passwordForCreate2,
      passwordForLogin,
      errorMessage,
      userName,
      checkAccountExistLimit,
      checkPasswordLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      __$$AuthImplCopyWithImpl<_$AuthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthImplToJson(
      this,
    );
  }
}

abstract class _Auth implements Auth {
  const factory _Auth(
      {final int? year,
      final String? email,
      final bool obscureText,
      final String? passwordForCreate1,
      final String? passwordForCreate2,
      final String? passwordForLogin,
      final String? errorMessage,
      final String? userName,
      final int checkAccountExistLimit,
      final int checkPasswordLimit}) = _$AuthImpl;

  factory _Auth.fromJson(Map<String, dynamic> json) = _$AuthImpl.fromJson;

  @override
  int? get year;
  @override
  String? get email;
  @override
  bool get obscureText;
  @override
  String? get passwordForCreate1;
  @override
  String? get passwordForCreate2;
  @override
  String? get passwordForLogin;
  @override
  String? get errorMessage;
  @override
  String? get userName;
  @override
  int get checkAccountExistLimit;
  @override
  int get checkPasswordLimit;
  @override
  @JsonKey(ignore: true)
  _$$AuthImplCopyWith<_$AuthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
