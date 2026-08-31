import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nahj/core/helper/app_constants.dart';
import 'package:nahj/core/theme/app_colors.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), _goToChooseAccountType);
  }

  @override
  void dispose() {
    _timer?.cancel(); // مهم جداً - لو المستخدم قفل الشاشة قبل ما التايمر يخلص
    super.dispose();
  }

  void _goToChooseAccountType() {
    if (!mounted) return;
    context.replace(AppConstants.chooseAccountScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff12977c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/svg/nahj_logo.svg',
              width: 200,
              height: 200,
            ),
            const Text(
              'Nahj',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Appcolors.backgroundcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
