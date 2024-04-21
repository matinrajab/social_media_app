import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';

class MyCircularIndicator {
  static Widget show() {
    return const Center(
      child: SizedBox(
        height: 50,
        width: 55,
        child: Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
