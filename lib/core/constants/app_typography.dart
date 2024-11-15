import 'package:flutter/cupertino.dart';
import 'app_colors.dart';

class AppTypography {
  // Headlines
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    letterSpacing: 0.37,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    letterSpacing: 0.36,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    letterSpacing: 0.35,
  );

  // Titles
  static const TextStyle title1 = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    letterSpacing: 0.37,
  );

  static const TextStyle title2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
    letterSpacing: 0.36,
  );

  static const TextStyle title3 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    letterSpacing: 0.35,
  );

  // Body text
  static const TextStyle body = TextStyle(
    fontSize: 17,
    color: AppColors.text,
    letterSpacing: -0.41,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
    letterSpacing: -0.41,
  );

  // Caption text
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.text,
    letterSpacing: 0,
  );

  static const TextStyle caption2 = TextStyle(
    fontSize: 11,
    color: AppColors.secondaryText,
    letterSpacing: 0.07,
  );
} 