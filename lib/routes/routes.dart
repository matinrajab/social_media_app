import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/auth/login_page.dart';
import 'package:social_media_app/ui/pages/auth/register_page.dart';
import 'package:social_media_app/ui/pages/comment/comment_page.dart';
import 'package:social_media_app/ui/pages/main/main_page.dart';
import 'package:social_media_app/ui/pages/post/post_page.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => LoginPage(),
  RegisterPage.routeName: (context) => RegisterPage(),
  MainPage.routeName: (context) => const MainPage(),
  PostPage.routeName: (context) => const PostPage(),
  CommentPage.routeName: (context) => const CommentPage(),
};
