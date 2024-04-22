import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/post_state.dart';
import 'package:social_media_app/models/post_model.dart';
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

  void getPosts() async {
    try {
      emit(PostLoading());

      List<PostModel> posts = await PostService().getPosts();

      emit(PostSuccess(posts));
    } catch (e) {
      emit(PostFailed('$e'));
    }
  }
}
