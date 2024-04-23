import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';
import 'package:social_media_app/ui/widgets/my_button.dart';

class DeleteModalBottomSheet {
  static void show(
    context, {
    required GestureTapCallback onTap,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 80,
          padding: const EdgeInsets.all(defaultPadding),
          decoration: const BoxDecoration(
            color: backgroundColor2,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                defaultRadius,
              ),
            ),
          ),
          child: MyButton(
            text: 'Delete',
            fontColor: dangerColor,
            height: 50,
            borderColor: transparentColor,
            onTap: onTap,
          ),
        );
      },
    );
  }
}
