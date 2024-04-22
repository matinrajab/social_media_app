import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;
  final String username;
  final String bio;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.bio,
  });

  @override
  List<Object?> get props => [id, email, name, username, bio];
}
