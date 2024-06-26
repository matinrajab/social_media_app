import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_media_app/shared/theme.dart';

class MyButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double radius;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final Color? buttonColor;
  final Color borderColor;
  final String text;
  final GestureTapCallback? onTap;

  const MyButton({
    super.key,
    this.height = 35,
    this.width,
    this.radius = defaultRadius,
    this.fontWeight,
    this.fontColor = primaryTextColor,
    this.buttonColor = transparentColor,
    this.borderColor = inactiveBorderColor,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(radius),
        color: buttonColor,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: onTap,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: fontWeight,
                  color: fontColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
