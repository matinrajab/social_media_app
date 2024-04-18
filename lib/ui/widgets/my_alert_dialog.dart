import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';

class MyAlertDialog extends StatelessWidget {
  final String alertText;
  final String acceptText;
  final Color? acceptFontColor;
  final String declineText;
  final GestureTapCallback onAcceptTapped;

  const MyAlertDialog({
    super.key,
    required this.alertText,
    required this.acceptText,
    this.acceptFontColor = dangerColor,
    this.declineText = 'Cancel',
    required this.onAcceptTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22),
      child: AlertDialog(
        backgroundColor: backgroundColor2,
        shape: RoundedRectangleBorder(
          borderRadius: defaultBorderRadius,
        ),
        contentPadding: const EdgeInsets.all(0),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2 * defaultPadding,
                ),
                child: Center(
                  child: Text(
                    alertText,
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Divider(
                color: dividerColor,
                height: 0,
              ),
              MyButton(
                text: acceptText,
                fontColor: acceptFontColor,
                height: 50,
                borderColor: transparentColor,
                radius: 0,
                onTap: onAcceptTapped,
              ),
              const Divider(
                color: dividerColor,
                height: 0,
              ),
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(
                    defaultRadius,
                  ),
                ),
                child: MyButton(
                  text: declineText,
                  height: 50,
                  borderColor: transparentColor,
                  radius: 0,
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
