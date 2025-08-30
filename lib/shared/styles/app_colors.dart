import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF13467D);
  static const Color primaryLight = Color(0xFF4A6B9A);
  static const Color primaryDark = Color(0xFF0D2F55);

  // Secondary Colors
  static const Color secondary = Color(0xFF7EB746);
  static const Color secondaryLight = Color(0xFF9BC768);
  static const Color secondaryDark = Color(0xFF5A8431);

  // Success Colors
  static const Color success = Color(0xFF28A745);
  static const Color successLight = Color(0xFF5CBF7A);
  static const Color successDark = Color(0xFF1E7E34);

  // Error Colors
  static const Color error = Color(0xFFDC3545);
  static const Color errorLight = Color(0xFFE66B7A);
  static const Color errorDark = Color(0xFFC82333);

  // Warning Colors
  static const Color warning = Color(0xFFFFC107);
  static const Color warningLight = Color(0xFFFFD439);
  static const Color warningDark = Color(0xFFE0A800);

  // Info Colors
  static const Color info = Color(0xFF17A2B8);
  static const Color infoLight = Color(0xFF4CB5C6);
  static const Color infoDark = Color(0xFF138496);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Colors.transparent;

  // Background Colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color backgroundDark = Color(0xFF212529);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF343A40);

  // Text Colors - Primary Text
  static const Color text1_1000 = Color(0xFF000000); // Black
  static const Color text1_900 = Color(0xFF1A1A1A);
  static const Color text1_800 = Color(0xFF333333);
  static const Color text1_700 = Color(0xFF4D4D4D);
  static const Color text1_600 = Color(0xFF666666);
  static const Color text1_500 = Color(0xFF808080);
  static const Color text1_400 = Color(0xFF999999);
  static const Color text1_300 = Color(0xFFB3B3B3);
  static const Color text1_200 = Color(0xFFCCCCCC);
  static const Color text1_100 = Color(0xFFE6E6E6);
  static const Color text1_50 = Color(0xFFF2F2F2);

  // Text Colors - Secondary Text
  static const Color text2_1000 = Color(0xFF212529);
  static const Color text2_900 = Color(0xFF343A40);
  static const Color text2_800 = Color(0xFF495057);
  static const Color text2_700 = Color(0xFF6C757D);
  static const Color text2_600 = Color(0xFF868E96);
  static const Color text2_500 = Color(0xFFADB5BD);
  static const Color text2_400 = Color(0xFFCED4DA);
  static const Color text2_300 = Color(0xFFDEE2E6);
  static const Color text2_200 = Color(0xFFE9ECEF);
  static const Color text2_100 = Color(0xFFF1F3F4);
  static const Color text2_50 = Color(0xFFF8F9FA);

  // Border Colors
  static const Color border = Color(0xFFDEE2E6);
  static const Color borderLight = Color(0xFFE9ECEF);
  static const Color borderDark = Color(0xFFCED4DA);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF13467D),
    Color(0xFF0D2F55),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFF7EB746),
    Color(0xFF5A8431),
  ];

  static const List<Color> successGradient = [
    Color(0xFF28A745),
    Color(0xFF1E7E34),
  ];

  // Special Colors
  static const Color accent = Color(0xFF20C997);
  static const Color highlight = Color(0xFFFFF3CD);
  static const Color overlay = Color(0x80000000);
  static const Color disabled = Color(0xFFADB5BD);

  // Semantic Colors
  static const Color online = Color(0xFF28A745);
  static const Color offline = Color(0xFF6C757D);
  static const Color pending = Color(0xFFFFC107);
  static const Color rejected = Color(0xFFDC3545);
  static const Color approved = Color(0xFF28A745);
}
