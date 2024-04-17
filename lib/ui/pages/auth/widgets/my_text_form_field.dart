import 'package:flutter/material.dart';
import 'package:social_media_app/ui/shared/theme.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: primaryTextStyle,
      cursorColor: primaryTextColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: inactiveBorderColor),
          borderRadius: defaultBorderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: whiteColor),
          borderRadius: defaultBorderRadius,
        ),
        labelText: labelText,
        labelStyle: subtitleTextStyle,
        contentPadding: const EdgeInsets.all(20),
      ),
    );
  }
}
