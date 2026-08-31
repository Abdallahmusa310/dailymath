import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nahj/core/helper/app_constants.dart';
import 'package:nahj/core/theme/app_colors.dart';
import 'package:nahj/core/widgets/translation_boutton.dart';
import 'package:nahj/features/auth/choose_account/widgets/choose_account_card.dart';
import 'package:nahj/generated/locale_keys.g.dart';

class ChooseAccountScreen extends StatefulWidget {
  const ChooseAccountScreen({
    super.key,
  });

  @override
  State<ChooseAccountScreen> createState() => _ChooseAccountTypeScreenState();
}

class _ChooseAccountTypeScreenState extends State<ChooseAccountScreen> {
  final _pageController = PageController();
  int _currentPage = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 4.w,
            vertical: 8.h,
          ),
          child: Column(
            children: [
              const SizedBox(height: 24),
              _PageDots(currentPage: _currentPage, pageCount: 2),
              const SizedBox(height: 16),
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: TranslationBoutton(),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  children: [
                    ChooseAccountCard(
                      svgPath: 'assets/images/svg/teacher.svg',
                      title: LocaleKeys.choose_account_teacher_title.tr(),
                      description:
                          LocaleKeys.choose_account_teacher_description.tr(),
                      onChoose: () =>
                          context.go(AppConstants.teacherLoginScreen),
                    ),
                    ChooseAccountCard(
                      svgPath: 'assets/images/svg/student.svg',
                      title: LocaleKeys.choose_account_student_title.tr(),
                      description:
                          LocaleKeys.choose_account_student_description.tr(),
                      onChoose: () =>
                          context.go(AppConstants.parentLoginScreen),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.currentPage, required this.pageCount});

  final int currentPage;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 10 : 8,
          height: isActive ? 10 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? Appcolors.primaryColor
                : Appcolors.primaryColor.withOpacity(0.25),
          ),
        );
      }),
    );
  }
}
