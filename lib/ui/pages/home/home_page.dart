import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/auth_cubit.dart';
import 'package:social_media_app/cubits/auth_state.dart';
import 'package:social_media_app/models/post_model.dart';
import 'package:social_media_app/services/post_service.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_circular_indicator.dart';
import 'package:social_media_app/ui/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          String idCurrentUser = state.user.id;
          return StreamBuilder<List<PostModel>>(
            stream: PostService().getAllPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final PostModel post = snapshot.data![index];
                    return PostCard(
                      idCurrentUser: idCurrentUser,
                      postId: post.postId!,
                      username: post.username,
                      dateTime: '2w',
                      content: post.content,
                      totalComments: 2,
                      likes: post.likes,
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: primaryTextStyle,
                  ),
                );
              } else {
                return MyCircularIndicator.show(color: whiteColor);
              }
            },
          );
        } else {
          return MyCircularIndicator.show(color: whiteColor);
        }
      },
    );
  }
}
