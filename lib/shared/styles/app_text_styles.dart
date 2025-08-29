import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

/// Semantic text styles untuk komponen UI yang berbeda
class AppTextStyles {
  AppTextStyles._();

  //* Display Styles (untuk heading besar)
  static TextStyle displayLarge = AppFonts.brandingBold32.copyWith(
    height: 1.2,
    letterSpacing: -0.5,
  );

  static TextStyle displayMedium = AppFonts.brandingBold28.copyWith(
    height: 1.2,
    letterSpacing: -0.25,
  );

  static TextStyle displaySmall = AppFonts.brandingBold24.copyWith(
    height: 1.3,
  );

  //* Headline Styles
  static TextStyle headlineLarge = AppFonts.brandingSemiBold24.copyWith(
    height: 1.3,
  );

  static TextStyle headlineMedium = AppFonts.brandingSemiBold20.copyWith(
    height: 1.3,
  );

  static TextStyle headlineSmall = AppFonts.brandingSemiBold18.copyWith(
    height: 1.4,
  );

  //* Title Styles
  static TextStyle titleLarge = AppFonts.primarySemiBold20.copyWith(
    height: 1.4,
  );

  static TextStyle titleMedium = AppFonts.primarySemiBold18.copyWith(
    height: 1.4,
  );

  static TextStyle titleSmall = AppFonts.primarySemiBold16.copyWith(
    height: 1.4,
  );

  //* Label Styles (untuk button, form label, dll)
  static TextStyle labelLarge = AppFonts.primaryMedium16.copyWith(
    height: 1.4,
    letterSpacing: 0.1,
  );

  static TextStyle labelMedium = AppFonts.primaryMedium14.copyWith(
    height: 1.4,
    letterSpacing: 0.5,
  );

  static TextStyle labelSmall = AppFonts.primaryMedium12.copyWith(
    height: 1.4,
    letterSpacing: 0.5,
  );

  //* Body Styles (untuk paragraph text)
  static TextStyle bodyLarge = AppFonts.primaryRegular16.copyWith(
    height: 1.5,
  );

  static TextStyle bodyMedium = AppFonts.primaryRegular14.copyWith(
    height: 1.5,
  );

  static TextStyle bodySmall = AppFonts.primaryRegular12.copyWith(
    height: 1.4,
  );

  //* Caption Styles (untuk text kecil)
  static TextStyle caption = AppFonts.primaryLight12.copyWith(
    color: AppColors.text1_600,
    height: 1.3,
  );

  static TextStyle overline = AppFonts.primaryMedium10.copyWith(
    color: AppColors.text1_600,
    letterSpacing: 1.5,
    height: 1.6,
  );

  //* Button Text Styles
  static TextStyle buttonLarge = AppFonts.primarySemiBold16.copyWith(
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle buttonMedium = AppFonts.primarySemiBold14.copyWith(
    letterSpacing: 0.5,
    height: 1.2,
  );

  static TextStyle buttonSmall = AppFonts.primaryMedium12.copyWith(
    letterSpacing: 0.5,
    height: 1.2,
  );

  //* Input Field Styles
  static TextStyle inputText = AppFonts.primaryRegular16.copyWith(
    height: 1.2,
  );

  static TextStyle inputLabel = AppFonts.primaryMedium14.copyWith(
    color: AppColors.text1_700,
    height: 1.2,
  );

  static TextStyle inputHint = AppFonts.primaryRegular16.copyWith(
    color: AppColors.text1_500,
    height: 1.2,
  );

  static TextStyle inputError = AppFonts.primaryRegular12.copyWith(
    color: AppColors.error,
    height: 1.3,
  );

  //* Card Styles
  static TextStyle cardTitle = AppFonts.primarySemiBold16.copyWith(
    height: 1.3,
  );

  static TextStyle cardSubtitle = AppFonts.primaryRegular14.copyWith(
    color: AppColors.text1_600,
    height: 1.4,
  );

  static TextStyle cardBody = AppFonts.primaryRegular14.copyWith(
    height: 1.5,
  );

  //* Navigation Styles
  static TextStyle tabLabel = AppFonts.primaryMedium14.copyWith(
    letterSpacing: 0.5,
  );

  static TextStyle navigationLabel = AppFonts.primaryMedium12.copyWith(
    letterSpacing: 0.5,
  );

  //* App Bar Styles
  static TextStyle appBarTitle = AppFonts.brandingSemiBold18.copyWith(
    color: AppColors.white,
  );

  static TextStyle appBarSubtitle = AppFonts.primaryRegular14.copyWith(
    color: AppColors.white.withValues(alpha: 0.8),
  );

  //* Dialog Styles
  static TextStyle dialogTitle = AppFonts.primarySemiBold18.copyWith(
    height: 1.3,
  );

  static TextStyle dialogContent = AppFonts.primaryRegular14.copyWith(
    height: 1.5,
    color: AppColors.text1_700,
  );

  //* Snackbar Styles
  static TextStyle snackbarMessage = AppFonts.primaryRegular14.copyWith(
    color: AppColors.white,
    height: 1.3,
  );

  //* Price/Number Styles
  static TextStyle priceDisplayLarge = AppFonts.brandingBold24.copyWith(
    color: AppColors.primary,
    height: 1.2,
  );

  static TextStyle priceDisplayMedium = AppFonts.brandingSemiBold20.copyWith(
    color: AppColors.primary,
    height: 1.2,
  );

  static TextStyle priceDisplaySmall = AppFonts.brandingSemiBold16.copyWith(
    color: AppColors.primary,
    height: 1.2,
  );

  //* Status Text Styles
  static TextStyle statusSuccess = AppFonts.primaryMedium14.copyWith(
    color: AppColors.success,
  );

  static TextStyle statusError = AppFonts.primaryMedium14.copyWith(
    color: AppColors.error,
  );

  static TextStyle statusWarning = AppFonts.primaryMedium14.copyWith(
    color: AppColors.warning,
  );

  static TextStyle statusInfo = AppFonts.primaryMedium14.copyWith(
    color: AppColors.info,
  );

  //* Link Styles
  static TextStyle linkText = AppFonts.primaryMedium14.copyWith(
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );

  static TextStyle linkTextSmall = AppFonts.primaryMedium12.copyWith(
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
}
