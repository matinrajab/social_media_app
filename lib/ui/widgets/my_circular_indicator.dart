import 'package:flutter/material.dart';
import 'package:social_media_app/shared/theme.dart';

class MyCircularIndicator {
  static Widget show({
    double size = 50,
    Color color = primaryColor,
    double strokeWidth = 4.0,
  }) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: Center(
          child: CircularProgressIndicator(
            color: color,
            strokeWidth: strokeWidth,
          ),
        ),
      ),
    );
  }
}
