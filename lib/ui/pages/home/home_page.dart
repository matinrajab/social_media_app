import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/post_cubit.dart';
import 'package:social_media_app/cubits/post_state.dart';
import 'package:social_media_app/models/post_model.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_circular_indicator.dart';
import 'package:social_media_app/ui/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      color: backgroundColor1,
      onRefresh: () async {
        context.read<PostCubit>().getPosts();
      },
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostSuccess) {
            List<PostModel> posts = state.posts;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostCard(
                  username: post.username,
                  dateTime: '2w',
                  content: post.content,
                  totalLikes: 3,
                  totalComments: 2,
                );
              },
            );
          } else {
            return MyCircularIndicator.show();
          }
        },
      ),
    );
  }
}
