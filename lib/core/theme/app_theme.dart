import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Tajawal',
      fontFamilyFallback: const ['Rubik'],
      scaffoldBackgroundColor: const Color(0xFFF8FAFA),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF085041),
        brightness: Brightness.light,
      ),
      textTheme: _buildTextTheme(Brightness.light),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Tajawal',
      fontFamilyFallback: const ['Rubik'],
      scaffoldBackgroundColor: const Color(0xFF0F1615),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF085041),
        brightness: Brightness.dark,
      ),
      textTheme: _buildTextTheme(Brightness.dark),
    );
  }

  static TextTheme _buildTextTheme(Brightness brightness) {
    final baseColor = brightness == Brightness.light
        ? const Color(0xFF1A1A1A)
        : const Color(0xFFF0F0F0);
    return TextTheme(
      displayLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: baseColor),
      headlineMedium: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: baseColor),
      titleLarge: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w600, color: baseColor),
      bodyLarge: TextStyle(fontSize: 16, color: baseColor),
      bodyMedium: TextStyle(fontSize: 14, color: baseColor),
    );
  }
}
