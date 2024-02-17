import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String userId;
  final String username;
  final String email;
  final String imgUrl;
  const AppUser({
    required this.userId,
    required this.username,
    required this.email,
    required this.imgUrl,
  });

  @override
  List<Object> get props => [userId, username, email, imgUrl];

  factory AppUser.fromJson(Map<String, dynamic> map) {
    return AppUser(
      userId: map['userId'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      imgUrl: map['imgUrl'] as String,
    );
  }
}
