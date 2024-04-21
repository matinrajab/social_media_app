import 'package:equatable/equatable.dart';
import 'package:social_media_app/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthFailed extends AuthState {
  final String error;

  const AuthFailed(this.error);

  @override
  List<Object?> get props => [error];
}
