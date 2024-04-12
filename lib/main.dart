import 'package:flutter/material.dart';
import 'package:social_media_app/routes/routes.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginPage.routeName,
      routes: routes,
    );
  }
}
