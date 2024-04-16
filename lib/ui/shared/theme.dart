import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double defaultPadding = 16.0;
const double defaultRadius = 10.0;

const Color primaryColor = Color(0xff0070FA);
const Color primaryTextColor = Color(0xffFFFFFF);
const Color secondaryTextColor = Color(0xffA0A0A0);
const Color subtitleTextColor = Color(0xffB8B8B8);
const Color redColor = Color(0xffEC4A55);
const Color whiteColor = Color(0xffFFFFFF);
const Color backgroundColor1 = Color(0xff0D0D0D);
const Color backgroundColor2 = Color(0xff191919);
const Color transparentColor = Colors.transparent;
const Color inactiveBorderColor = Color(0xff3F3F3F);
const Color inactiveButtonColor = Color(0xff545454);

TextStyle primaryColorTextStyle = GoogleFonts.poppins(
  color: primaryColor,
);

TextStyle primaryTextStyle = GoogleFonts.poppins(
  color: primaryTextColor,
);

TextStyle secondaryTextStyle = GoogleFonts.poppins(
  color: secondaryTextColor,
);

TextStyle subtitleTextStyle = GoogleFonts.poppins(
  color: subtitleTextColor,
);

const FontWeight light = FontWeight.w300;
const FontWeight regular = FontWeight.w400;
const FontWeight medium = FontWeight.w500;
const FontWeight semiBold = FontWeight.w600;
const FontWeight bold = FontWeight.w700;
const FontWeight extraBold = FontWeight.w800;
const FontWeight black = FontWeight.w900;

BorderRadius defaultBorderRadius = BorderRadius.circular(defaultRadius);

const IconData closeIcon = Icons.close_rounded;
const IconData backIcon = Icons.arrow_back_ios_new_rounded;
