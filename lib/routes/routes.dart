import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/auth/auth_page.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';
import 'package:social_media_app/ui/pages/auth/register_page.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';
import 'package:social_media_app/ui/pages/post/post_page.dart';
import 'package:social_media_app/ui/pages/profile/edit_profile_page.dart';
import 'package:social_media_app/ui/pages/setting/setting_page.dart';

final Map<String, WidgetBuilder> routes = {
  AuthPage.routeName: (context) => const AuthPage(),
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  MainPage.routeName: (context) => MainPage(),
  PostPage.routeName: (context) => PostPage(),
  EditProfilePage.routeName: (context) => const EditProfilePage(),
  SettingPage.routeName: (context) => const SettingPage(),
};
