import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

class LocalizationService {
  static String languageCode(BuildContext context) =>
      context.locale.languageCode;

  static bool isArabic(BuildContext context) => languageCode(context) == 'ar';

  static bool isEnglish(BuildContext context) => languageCode(context) == 'en';

  static TextDirection textDirection(BuildContext context) =>
      isArabic(context) ? TextDirection.rtl : TextDirection.ltr;

  /// Applies locale and rebuilds all widgets that read [context.locale] or
  /// use [BuildContext.tr].
  static Future<void> changeLocale(BuildContext context, Locale locale) async {
    await context.setLocale(locale);
  }
}
