import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/text_controller_state.dart';

class TextControllerCubit extends Cubit<TextControllerState> {
  TextControllerCubit() : super(TextControllerEmpty());

  void isTextControllerEmpty(String text) {
    text.isEmpty ? emit(TextControllerEmpty()) : emit(TextControllerNotEmpty());
  }
}
