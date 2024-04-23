import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/post_cubit.dart';
import 'package:social_media_app/helpers/date_formatter.dart';
import 'package:social_media_app/models/post_model.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/pages/comment/comment_page.dart';
import 'package:social_media_app/ui/widgets/delete_modal_bottom_sheet.dart';
import 'package:social_media_app/ui/widgets/my_alert_dialog.dart';

class PostCard extends StatelessWidget {
  final String usernameCurrentUser;
  final PostModel post;

  const PostCard({
    super.key,
    required this.usernameCurrentUser,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    bool isLiked = post.likes.contains(usernameCurrentUser);

    void toggleLike() {
      isLiked = !isLiked;

      context.read<PostCubit>().toggleLike(
            isLiked: isLiked,
            usernameCurrentUser: usernameCurrentUser,
            postId: post.id!,
          );
    }

    displayDialog() async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => MyAlertDialog(
          alertText: 'Delete this Post?',
          acceptText: 'Delete',
          onAcceptTapped: () {
            context.read<PostCubit>().deletePost(post.id!);
            Navigator.pop(context);
          },
        ),
      );
      if (!context.mounted) return;
      Navigator.pop(context);
    }

    onMoreTapped() {
      DeleteModalBottomSheet.show(
        context,
        onTap: displayDialog,
      );
    }

    return Column(
      children: [
        Padding(
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
                            post.username,
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              dateFormatter(post.timestamp),
                              style: secondaryTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                            (post.username == usernameCurrentUser)
                                ? Row(
                                    children: [
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: onMoreTapped,
                                        child: const Icon(
                                          moreHorizIcon,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      post.content,
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: light,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildAction(
                          iconPath: isLiked
                              ? '$iconsDir/is_liked.png'
                              : '$iconsDir/is_not_liked.png',
                          total: post.likes.length,
                          onTap: toggleLike,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        buildAction(
                          iconPath: '$iconsDir/comment.png',
                          total: 0,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentPage(
                                usernameCurrentUser: usernameCurrentUser,
                                post: post,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: dividerColor,
        ),
      ],
    );
  }

  Widget buildAction({
    required String iconPath,
    required int total,
    GestureTapCallback? onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            iconPath,
            width: 24,
          ),
        ),
        Text(
          '$total',
          style: secondaryTextStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
