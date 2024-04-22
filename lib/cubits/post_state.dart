import 'package:equatable/equatable.dart';
import 'package:social_media_app/models/post_model.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<PostModel> posts;

  const PostSuccess(this.posts);

  @override
  List<Object> get props => [posts];
}

class PostFailed extends PostState {
  final String error;

  const PostFailed(this.error);

  @override
  List<Object> get props => [error];
}