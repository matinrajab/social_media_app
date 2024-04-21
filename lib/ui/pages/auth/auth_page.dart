import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth';

  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MainPage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
