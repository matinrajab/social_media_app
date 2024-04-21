import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';

class MyMessage {
  static void displayMessage(
    context, {
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: backgroundColor2,
        title: Text(
          message,
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: defaultBorderRadius,
        ),
      ),
    );
  }
}
