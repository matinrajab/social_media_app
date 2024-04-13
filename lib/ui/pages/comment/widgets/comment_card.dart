import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/assets_dir.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class CommentCard extends StatelessWidget {
  final String username;
  final String dateTime;
  final String content;

  const CommentCard({
    super.key,
    required this.username,
    required this.dateTime,
    required this.content,
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
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: backgroundColor2,
        ),
      ],
    );
  }
}
