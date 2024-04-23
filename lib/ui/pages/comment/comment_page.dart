import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/comment_cubit.dart';
import 'package:social_media_app/cubits/text_controller_cubit.dart';
import 'package:social_media_app/cubits/text_controller_state.dart';
import 'package:social_media_app/models/comment_model.dart';
import 'package:social_media_app/models/post_model.dart';
import 'package:social_media_app/services/comment_service.dart';
import 'package:social_media_app/ui/pages/comment/widgets/comment_card.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_app_bar.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';
import 'package:social_media_app/ui/widgets/my_circular_indicator.dart';
import 'package:social_media_app/ui/widgets/post_card.dart';

class CommentPage extends StatelessWidget {
  final String usernameCurrentUser;
  final PostModel post;

  CommentPage({
    super.key,
    required this.usernameCurrentUser,
    required this.post,
  });

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context
        .read<TextControllerCubit>()
        .isTextControllerEmpty(_commentController.text);

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: const MyAppBar(
        text: 'Comments',
        leadingIcon: backIcon,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                PostCard(
                  usernameCurrentUser: usernameCurrentUser,
                  post: post,
                ),
                StreamBuilder<List<CommentModel>>(
                  stream: CommentService().getCommentsByPostId(post.id!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<CommentModel> comments = snapshot.data!;
                      return Column(
                        children: comments
                            .map(
                              (comment) => CommentCard(
                                comment: comment,
                              ),
                            )
                            .toList(),
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
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              controller: _commentController,
              onChanged: (value) {
                context
                    .read<TextControllerCubit>()
                    .isTextControllerEmpty(value.trim());
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
                  margin: const EdgeInsets.all(8),
                  child: Image.asset(
                    '$imagesDir/avatar.png',
                    width: 36,
                  ),
                ),
                suffixIcon:
                    BlocBuilder<TextControllerCubit, TextControllerState>(
                  builder: (context, state) => (state is TextControllerEmpty)
                      ? const SizedBox()
                      : Container(
                          margin: const EdgeInsets.all(8),
                          child: MyButton(
                            text: 'Post',
                            width: 65,
                            fontColor: backgroundColor1,
                            buttonColor: whiteColor,
                            borderColor: whiteColor,
                            radius: 20,
                            onTap: () {
                              context.read<CommentCubit>().addComment(
                                    content: _commentController.text.trim(),
                                    usernameCurrentUser: usernameCurrentUser,
                                    postId: post.id!,
                                  );
                              _commentController.clear();
                              context
                                  .read<TextControllerCubit>()
                                  .isTextControllerEmpty(
                                      _commentController.text);
                            },
                          ),
                        ),
                ),
                hintText: 'Add a comment for ...',
                hintStyle: secondaryTextStyle,
                contentPadding: const EdgeInsets.all(8),
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
