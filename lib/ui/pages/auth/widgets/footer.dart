import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class Footer extends StatelessWidget {
  final String text;
  final String textButton;
  final GestureTapCallback? onTap;

  const Footer({
    super.key,
    required this.text,
    required this.textButton,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text ',
            style: primaryTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              textButton,
              style: primaryColorTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          )
        ],
      ),
    );
  }
}
