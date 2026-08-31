import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nahj/core/theme/app_colors.dart';
import 'package:nahj/core/theme/textstyle_extntion.dart';
import 'package:nahj/core/widgets/shared_boutton.dart';
import 'package:nahj/generated/locale_keys.g.dart';

class TranslationBottomSheet extends StatefulWidget {
  const TranslationBottomSheet({super.key});

  @override
  State<TranslationBottomSheet> createState() => _TranslationBottomSheetState();
}

class _TranslationBottomSheetState extends State<TranslationBottomSheet> {
  String? selectedLang;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedLang ??= context.locale.languageCode;
  }

  void _applyLocale() {
    if (!mounted) return;
    final locale =
        selectedLang == 'ar' ? const Locale('ar') : const Locale('en');
    Navigator.pop(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Appcolors.backgroundcolor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.tr(LocaleKeys.choose_account_Choose_language)} :',
              style: const TextStyle().appFont.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Appcolors.balck,
                  ),
            ),
            SizedBox(height: 10.h),
            _buildLanguageItem(
              title: 'العربيه',
              icon: 'assets/images/svg/arIcon.svg',
              isSelected: selectedLang == 'ar',
              onTap: () => setState(() => selectedLang = 'ar'),
            ),
            _buildLanguageItem(
              title: 'English',
              icon: 'assets/images/svg/enIcon.svg',
              isSelected: selectedLang == 'en',
              onTap: () => setState(() => selectedLang = 'en'),
            ),
            SizedBox(height: 10.h),
            Sharedboutton(
              width: double.infinity,
              text: context.tr(LocaleKeys.choose_account_Confirm),
              onTap: _applyLocale,
              color: Appcolors.primaryColor,
              borderRadius: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageItem({
    required String title,
    required String icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: Appcolors.white,
      elevation: isSelected ? 1 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isSelected ? Appcolors.textcolor : Colors.transparent,
          width: 1.w,
        ),
      ),
      child: ListTile(
        leading: SvgPicture.asset(icon, width: 18.w, height: 18.h),
        title: Text(
          title,
          style: const TextStyle().appFont.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Appcolors.primaryColor,
              ),
        ),
        trailing: isSelected
            ? const Icon(Icons.check_circle, color: Colors.green)
            : null,
        onTap: onTap,
      ),
    );
  }
}
