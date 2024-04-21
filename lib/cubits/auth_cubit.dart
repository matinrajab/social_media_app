import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/models/user_model.dart';
import 'package:social_media_app/services/auth_service.dart';
import 'package:social_media_app/services/user_service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.code));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String name,
    required String username,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signUp(
        email: email,
        password: password,
        name: name,
        username: username,
      );

      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.code));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthService().signOut();
      emit(AuthInitial());
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.code));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user = await UserService().getUserById(id);
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (e) {
      emit(AuthFailed(e.code));
    }
  }
}
