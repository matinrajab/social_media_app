import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/comment/comment_page.dart';
import 'package:social_media_app/ui/widgets/post_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, CommentPage.routeName),
          child: const PostCard(
            username: 'zuck',
            dateTime: '2w',
            content:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
            totalLikes: 5,
            totalComments: 0,
          ),
        ),
      ],
    );
  }
}
