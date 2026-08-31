import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nahj/core/theme/app_colors.dart';
import 'package:nahj/core/theme/textstyle_extntion.dart';
import 'package:nahj/core/widgets/shared_boutton.dart';
import 'package:nahj/generated/locale_keys.g.dart';

class ChooseAccountCard extends StatelessWidget {
  const ChooseAccountCard({
    required this.svgPath,
    required this.title,
    required this.description,
    required this.onChoose,
  });

  final String svgPath;
  final String title;
  final String description;
  final VoidCallback onChoose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgPath, width: 130, height: 130),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle().appFont.copyWith(
                    fontSize: 24,
                    color: Appcolors.primaryColor,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle().appFont.copyWith(
                    fontSize: 14,
                    color: Appcolors.textcolor,
                    height: 1.6,
                  ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: Sharedboutton(
                text: context.tr(LocaleKeys.choose_account_Choose),
                onTap: onChoose,
                color: Appcolors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
