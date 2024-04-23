import 'package:equatable/equatable.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {}

class PostFailed extends PostState {
  final String error;

  const PostFailed(this.error);

  @override
  List<Object> get props => [error];
}
