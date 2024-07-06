
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
    int? year,
    String? email,
    @Default(true)bool obscureText,
    String? passwordForCreate1,
    String? passwordForCreate2,
    String? passwordForLogin,
    String? errorMessage,
    @Default(5)int checkAccountExistLimit,
    @Default(5)int checkPasswordLimit,
  }) = _Auth;
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
