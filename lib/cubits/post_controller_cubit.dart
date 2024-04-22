import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/post_controller_state.dart';

class PostControllerCubit extends Cubit<PostControllerState> {
  PostControllerCubit() : super(PostControllerEmpty());

  void isPostControllerEmpty(String text) {
    text.isEmpty ? emit(PostControllerEmpty()) : emit(PostControllerNotEmpty());
  }
}
