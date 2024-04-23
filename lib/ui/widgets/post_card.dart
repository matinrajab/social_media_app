import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/cubits/post_cubit.dart';
import 'package:social_media_app/shared/assets_dir.dart';
import 'package:social_media_app/shared/theme.dart';

class PostCard extends StatelessWidget {
  final String idCurrentUser;
  final String postId;
  final String username;
  final String content;
  final String dateTime;
  final int totalComments;
  final List<String> likes;

  const PostCard({
    super.key,
    required this.idCurrentUser,
    required this.postId,
    required this.username,
    required this.content,
    required this.dateTime,
    required this.totalComments,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    bool isLiked = likes.contains(idCurrentUser);

    void toggleLike() {
      isLiked = !isLiked;

      context.read<PostCubit>().toggleLike(
            isLiked: isLiked,
            idCurrentUser: idCurrentUser,
            postId: postId,
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
                            username,
                            style: primaryTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semiBold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          dateTime,
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      content,
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
                          total: likes.length,
                          onTap: toggleLike,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        buildAction(
                          iconPath: '$iconsDir/comment.png',
                          total: totalComments,
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
