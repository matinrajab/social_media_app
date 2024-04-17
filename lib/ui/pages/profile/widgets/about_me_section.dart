import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/assets_dir.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Matin Muhammad R',
                    style: primaryTextStyle.copyWith(
                      fontSize: 22,
                      fontWeight: bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'matinmr__',
                    style: primaryTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              '$imagesDir/avatar.png',
              height: 68,
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          'Bio asdf qwer gdfgdf hegwret dfsfasdf asdfd asfw qer weg weg dfg dfsdsfadsf dasfa sf saasda',
          style: primaryTextStyle.copyWith(
            fontSize: 13,
            fontWeight: light,
          ),
        ),
      ],
    );
  }
}
