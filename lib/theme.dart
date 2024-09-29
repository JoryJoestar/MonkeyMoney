import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color background = Color(0xFFF9F9F9);

  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyWhite = Color(0xFFFAFAFA);

  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color lightBlack = Color.fromARGB(255, 42, 42, 42);
  static const Color lighterBlack = Color.fromARGB(255, 80, 80, 80);

  static const Color grey = Color.fromARGB(255, 86, 86, 86);
  static const Color darkGrey = Color.fromARGB(255, 61, 61, 61);

  static const Color darkText = Color.fromARGB(255, 56, 56, 56);
  static const Color darkerText = Color.fromARGB(255, 41, 41, 41);
  static const Color lightText = Color.fromARGB(255, 116, 116, 116);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'Roboto';

  static const TextStyle appBarFirstText = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 32,
    letterSpacing: .4,
    color: black,
  );

  static const TextStyle appBarLastText = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 32,
    letterSpacing: 0.4,
    color: lightBlack,
  );

  static const TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
