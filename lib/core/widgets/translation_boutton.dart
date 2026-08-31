import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nahj/core/services/localization_service.dart';
import 'package:nahj/core/theme/app_colors.dart';
import 'package:nahj/core/theme/textstyle_extntion.dart';
import 'package:nahj/core/widgets/translation_bottomsheet.dart';

class TranslationBoutton extends StatelessWidget {
  const TranslationBoutton({
    super.key,
    this.onLocaleChanged,
  });
  final VoidCallback? onLocaleChanged;

  Future<void> openLanguageSheet(BuildContext context) async {
    final locale = await showModalBottomSheet<Locale>(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black.withValues(alpha: 0.3),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const TranslationBottomSheet(),
    );

    if (locale != null && context.mounted) {
      await LocalizationService.changeLocale(context, locale);
      onLocaleChanged?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.languageCode;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GestureDetector(
        onTap: () => openLanguageSheet(context),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  locale == 'ar'
                      ? 'assets/images/svg/arIcon.svg'
                      : 'assets/images/svg/enIcon.svg',
                  width: 20.w,
                  height: 14.h,
                ),
                SizedBox(width: 4.w),
                Text(
                  locale == 'ar' ? 'ع' : 'EN',
                  style: const TextStyle().appFont.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Appcolors.primaryColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
