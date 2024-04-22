import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/single_child_widget.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/page_cubit.dart';
import 'package:social_media_app/cubits/post_controller_cubit.dart';
import 'package:social_media_app/cubits/post_cubit.dart';

final List<SingleChildWidget> providers = [
  BlocProvider<AuthCubit>(
    create: (BuildContext context) => AuthCubit(),
  ),
  BlocProvider<PageCubit>(
    create: (BuildContext context) => PageCubit(),
  ),
  BlocProvider<PostCubit>(
    create: (BuildContext context) => PostCubit(),
  ),
  BlocProvider<PostControllerCubit>(
    create: (BuildContext context) => PostControllerCubit(),
  ),
];
