import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {}

class UserFailed extends UserState {
  final String error;

  const UserFailed(this.error);

  @override
  List<Object?> get props => [error];
}
