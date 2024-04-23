import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return LoginPage();
    } else {
      context.read<AuthCubit>().getCurrentUser(user.uid);
      return MainPage();
    }
  }
}
