import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/post_state.dart';
import 'package:social_media_app/services/post_service.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());

  void createPost({
    required String username,
    required String content,
  }) async {
    try {
      emit(PostLoading());
      await PostService().createPost(
        username: username,
        content: content,
      );
      emit(const PostSuccess([]));
    } catch (e) {
      emit(PostFailed('$e'));
    }
  }

  void toggleLike({
    required bool isLiked,
    required String idCurrentUser,
    required String postId,
  }) async {
    try {
      emit(PostLoading());

      await PostService().toggleLike(
        isLiked: isLiked,
        idCurrentUser: idCurrentUser,
        postId: postId,
      );

      emit(const PostSuccess([]));
    } catch (e) {
      emit(PostFailed('$e'));
    }
  }
}
