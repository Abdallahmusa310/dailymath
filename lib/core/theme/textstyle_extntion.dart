import 'package:flutter/material.dart';

extension AppFontExtension on TextStyle {
  TextStyle get appFont {
    return copyWith(
      fontFamily: 'Tajawal',
      fontFamilyFallback: const ['Rubik'],
    );
  }
}
