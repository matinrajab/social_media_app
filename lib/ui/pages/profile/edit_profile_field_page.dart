import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';

class EditProfileFieldPage extends StatelessWidget {
  final String title;
  final String content;
  final int? maxLength;

  const EditProfileFieldPage({
    super.key,
    required this.title,
    required this.content,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController =
        TextEditingController(text: content);

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: MyAppBar(
        text: 'Edit ${title.toLowerCase()}',
        leadingIcon: closeIcon,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              checkIcon,
              color: whiteColor,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TextFormField(
          controller: textController,
          autofocus: true,
          style: primaryTextStyle,
          cursorColor: primaryTextColor,
          maxLength: maxLength,
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
            labelText: title,
            labelStyle: secondaryTextStyle,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: secondaryTextColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: whiteColor),
            ),
          ),
        ),
      ),
    );
  }
}
