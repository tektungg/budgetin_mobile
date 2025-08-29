import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

/// Extension untuk memudahkan kustomisasi TextStyle
extension TextStyleExtensions on TextStyle {
  /// Mengubah warna text
  TextStyle withColor(Color color) => copyWith(color: color);

  /// Mengubah ukuran font
  TextStyle withSize(double size) => copyWith(fontSize: size);

  /// Mengubah font weight
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  /// Mengubah line height
  TextStyle withHeight(double height) => copyWith(height: height);

  /// Mengubah letter spacing
  TextStyle withLetterSpacing(double spacing) =>
      copyWith(letterSpacing: spacing);

  /// Mengubah font family
  TextStyle withFamily(String family) => copyWith(fontFamily: family);

  /// Menambah text decoration
  TextStyle withDecoration(TextDecoration decoration) =>
      copyWith(decoration: decoration);

  /// Menambah shadow
  TextStyle withShadow(List<Shadow> shadows) => copyWith(shadows: shadows);

  /// Preset untuk text yang disabled
  TextStyle get disabled => copyWith(color: AppColors.disabled);

  /// Preset untuk text yang error
  TextStyle get error => copyWith(color: AppColors.error);

  /// Preset untuk text yang success
  TextStyle get success => copyWith(color: AppColors.success);

  /// Preset untuk text yang warning
  TextStyle get warning => copyWith(color: AppColors.warning);

  /// Preset untuk text yang info
  TextStyle get info => copyWith(color: AppColors.info);

  /// Preset untuk text dengan opacity
  TextStyle withOpacity(double opacity) {
    final color = this.color ?? AppColors.text1_1000;
    return copyWith(color: color.withValues(alpha: opacity));
  }

  /// Preset untuk text yang underline
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Preset untuk text yang strikethrough
  TextStyle get strikethrough =>
      copyWith(decoration: TextDecoration.lineThrough);

  /// Preset untuk text yang italic
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Preset untuk text dengan background color
  TextStyle withBackground(Color backgroundColor) =>
      copyWith(backgroundColor: backgroundColor);
}

/// Helper class untuk quick access ke common text styles
class Typography {
  Typography._();

  /// Display styles
  static TextStyle get displayLarge => AppFonts.brandingBold32;
  static TextStyle get displayMedium => AppFonts.brandingBold28;
  static TextStyle get displaySmall => AppFonts.brandingBold24;

  /// Headline styles
  static TextStyle get h1 => AppFonts.brandingSemiBold24;
  static TextStyle get h2 => AppFonts.brandingSemiBold20;
  static TextStyle get h3 => AppFonts.brandingSemiBold18;
  static TextStyle get h4 => AppFonts.primarySemiBold16;
  static TextStyle get h5 => AppFonts.primarySemiBold14;
  static TextStyle get h6 => AppFonts.primarySemiBold12;

  /// Body styles
  static TextStyle get bodyLarge => AppFonts.primaryRegular16;
  static TextStyle get bodyMedium => AppFonts.primaryRegular14;
  static TextStyle get bodySmall => AppFonts.primaryRegular12;

  /// Caption styles
  static TextStyle get caption =>
      AppFonts.primaryLight12.withColor(AppColors.text1_600);
  static TextStyle get overline =>
      AppFonts.primaryMedium10.withColor(AppColors.text1_600);

  /// Button styles
  static TextStyle get button => AppFonts.primarySemiBold14;
  static TextStyle get buttonLarge => AppFonts.primarySemiBold16;
  static TextStyle get buttonSmall => AppFonts.primaryMedium12;

  /// Link styles
  static TextStyle get link =>
      AppFonts.primaryMedium14.withColor(AppColors.primary).underline;
}

/// Theme helper untuk mendapatkan text theme yang sudah dikonfigurasi
class AppTextTheme {
  static TextTheme get textTheme => TextTheme(
        displayLarge: AppFonts.brandingBold32.copyWith(height: 1.2),
        displayMedium: AppFonts.brandingBold28.copyWith(height: 1.2),
        displaySmall: AppFonts.brandingBold24.copyWith(height: 1.3),
        headlineLarge: AppFonts.brandingSemiBold24.copyWith(height: 1.3),
        headlineMedium: AppFonts.brandingSemiBold20.copyWith(height: 1.3),
        headlineSmall: AppFonts.brandingSemiBold18.copyWith(height: 1.4),
        titleLarge: AppFonts.primarySemiBold20.copyWith(height: 1.4),
        titleMedium: AppFonts.primarySemiBold18.copyWith(height: 1.4),
        titleSmall: AppFonts.primarySemiBold16.copyWith(height: 1.4),
        labelLarge:
            AppFonts.primaryMedium16.copyWith(height: 1.4, letterSpacing: 0.1),
        labelMedium:
            AppFonts.primaryMedium14.copyWith(height: 1.4, letterSpacing: 0.5),
        labelSmall:
            AppFonts.primaryMedium12.copyWith(height: 1.4, letterSpacing: 0.5),
        bodyLarge: AppFonts.primaryRegular16.copyWith(height: 1.5),
        bodyMedium: AppFonts.primaryRegular14.copyWith(height: 1.5),
        bodySmall: AppFonts.primaryRegular12.copyWith(height: 1.4),
      );
}
