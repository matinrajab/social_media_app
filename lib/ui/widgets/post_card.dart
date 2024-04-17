import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/assets_dir.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String dateTime;
  final String content;
  final int totalLikes;
  final int totalComments;

  const PostCard({
    super.key,
    required this.username,
    required this.dateTime,
    required this.content,
    required this.totalLikes,
    required this.totalComments,
  });

  @override
  Widget build(BuildContext context) {
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
                          '$iconsDir/is_not_liked.png',
                          totalLikes,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        buildAction(
                          '$iconsDir/comment.png',
                          totalComments,
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

  Widget buildAction(String iconPath, int total) {
    return Column(
      children: [
        Image.asset(
          iconPath,
          width: 24,
        ),
        Text(
          '$total',
          style: secondaryTextStyle.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
