import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/ui/pages/comment/widgets/comment_card.dart';
import 'package:social_media_app/ui/shared/assets_dir.dart';
import 'package:social_media_app/ui/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';
import 'package:social_media_app/ui/widgets/post_card.dart';

class CommentPage extends StatefulWidget {
  static const routeName = '/comment';

  CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: MyAppBar(
        text: 'Comments',
        leadingIcon: backIcon,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                PostCard(
                  username: 'zuck',
                  dateTime: '2w',
                  content:
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                  totalLikes: 5,
                  totalComments: 0,
                ),
                Column(
                  children: [
                    CommentCard(
                      username: 'zuck',
                      dateTime: '2w',
                      content:
                          'This is comment text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                    ),
                    CommentCard(
                      username: 'zuck',
                      dateTime: '2w',
                      content:
                          'This is comment text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                    ),
                    CommentCard(
                      username: 'zuck',
                      dateTime: '2w',
                      content:
                          'This is comment text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an',
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              controller: _commentController,
              onChanged: (value) {
                setState(() {});
              },
              style: primaryTextStyle,
              cursorColor: primaryTextColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: backgroundColor2),
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: backgroundColor2),
                  borderRadius: BorderRadius.circular(30),
                ),
                prefixIcon: Container(
                  margin: EdgeInsets.all(8),
                  child: Image.asset(
                    '$imagesDir/avatar.png',
                    width: 36,
                  ),
                ),
                suffixIcon: _commentController.text.isEmpty
                    ? const SizedBox()
                    : Container(
                        margin: EdgeInsets.all(8),
                        child: MyButton(
                          text: 'Post',
                          width: 65,
                          fontColor: backgroundColor1,
                          buttonColor: whiteColor,
                          borderColor: whiteColor,
                          radius: 50,
                          onTap: () {
                            _commentController.clear();
                          },
                        ),
                      ),
                hintText: 'Add a comment for ...',
                hintStyle: secondaryTextStyle,
                contentPadding: EdgeInsets.all(8),
                filled: true,
                fillColor: backgroundColor2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
