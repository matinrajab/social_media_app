import 'package:flutter/material.dart';
import 'package:social_media_app/ui/theme/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';

class PostPage extends StatelessWidget {
  static const routeName = '/post';

  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'New Post',
        leadingIcon: closeIcon,
      ),
      body: Center(
        child: Text(
          'Post Page',
          style: primaryTextStyle,
        ),
      ),
    );
  }
}
