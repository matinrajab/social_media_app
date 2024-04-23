import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/user_state.dart';
import 'package:social_media_app/services/user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void updateUserField({
    required String id,
    required String field,
    required String newValue,
  }) async {
    try {
      emit(UserLoading());

      await UserService().updateUserField(
        id: id,
        field: field,
        newValue: newValue,
      );

      emit(UserSuccess());
    } catch (e) {
      emit(UserFailed('$e'));
    }
  }
}
