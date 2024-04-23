import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/comment_state.dart';
import 'package:social_media_app/services/comment_service.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  void addComment({
    required String content,
    required String usernameCurrentUser,
    required String postId,
  }) async {
    try {
      emit(CommentLoading());

      await CommentService().addComment(
        content: content,
        usernameCurrentUser: usernameCurrentUser,
        postId: postId,
      );

      emit(CommentSuccess());
    } catch (e) {
      emit(CommentFailed('$e'));
    }
  }
}
