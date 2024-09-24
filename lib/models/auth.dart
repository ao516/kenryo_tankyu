
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

@freezed
class Auth with _$Auth {
  const factory Auth({
    int? year,
    String? email,
    String? password,
    String? userName,
    @Default(false) bool confirmVerifyEmail,
    @Default(5)int limit,
  }) = _Auth;
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
