import 'package:equatable/equatable.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentSuccess extends CommentState {}

class CommentFailed extends CommentState {
  final String error;

  const CommentFailed(this.error);

  @override
  List<Object> get props => [error];
}
