import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontSizes {
  static const extraSmall = 14.0;
  static const small = 16.0;
  static const standard = 18.0;
  static const large = 20.0;
  static const extraLarge = 24.0;
  static const doubleExtraLarge = 32.0;
}

class DefaultColors {
  static const Color appWhite = Color(0xFFFFFFFF);
  static const Color appBlack = Colors.black;
  static const Color pink = Color(0xFFEA2B83);
  static const Color lightpink = Color(0xFFFCDDEC);
  static const Color purple = Color(0xFF8E8FF8);
  static const Color orange = Color(0xFFF18F3B);
  static const Color lightteal = Color(0xFF58D5D4);
  static const Color primaryColor = Color(0xFFAEAFF7);
  static const Color focusColor = Color(0xFF371B34);

  static Color task1 = Colors.pink[100]!;
  static Color task2 = Colors.orange[100]!;
  static Color task3 = Colors.green[100]!;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: DefaultColors.primaryColor,
      focusColor: DefaultColors.focusColor,
      textTheme: TextTheme(
        bodySmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: DefaultColors.appWhite,
        ),
        bodyMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.standard,
          color: DefaultColors.appWhite,
        ),
        bodyLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: DefaultColors.appWhite,
        ),
        titleSmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.large,
          color: DefaultColors.appBlack,
        ),
        titleMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.extraLarge,
          color: DefaultColors.appBlack,
        ),
        titleLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          color: DefaultColors.appBlack,
          fontWeight: FontWeight.bold,
        ),
        labelSmall: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.small,
          color: DefaultColors.appBlack,
        ),
        labelMedium: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.extraLarge,
          color: DefaultColors.appBlack,
        ),
        labelLarge: GoogleFonts.alegreyaSans(
          fontSize: FontSizes.doubleExtraLarge,
          color: DefaultColors.appBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
