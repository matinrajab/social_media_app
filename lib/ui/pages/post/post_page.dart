import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/assets_dir.dart';
import 'package:social_media_app/ui/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';

class PostPage extends StatefulWidget {
  static const routeName = '/post';

  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'New Post',
        leadingIcon: closeIcon,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                '$imagesDir/avatar.png',
                width: 36,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'username',
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        _postController.text.isNotEmpty
                            ? GestureDetector(
                                onTap: () => setState(() {
                                  _postController.clear();
                                }),
                                child: const Icon(
                                  closeIcon,
                                  color: secondaryTextColor,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextFormField(
                      controller: _postController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      style: primaryTextStyle,
                      cursorColor: primaryTextColor,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'What\'s new?',
                        hintStyle: subtitleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: light,
                        ),
                      ),
                      minLines: 1,
                      maxLines: 100,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MyButton(
                      text: 'Post',
                      width: 65,
                      fontColor: backgroundColor1,
                      buttonColor: _postController.text.isEmpty
                          ? inactiveWhiteButtonColor
                          : whiteColor,
                      borderColor: _postController.text.isEmpty
                          ? inactiveWhiteButtonColor
                          : whiteColor,
                      radius: 20,
                      onTap: _postController.text.isEmpty
                          ? () {}
                          : () {
                              setState(() {
                                _postController.clear();
                              });
                            },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
