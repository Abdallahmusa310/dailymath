import 'package:dialymath/screens/navigationbar_screen/navigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Center(
              child:
                  LottieBuilder.asset('assets/Animation - 1724422585602.json'))
        ],
      ),
      nextScreen: const Navbar(),
      splashIconSize: 500,
      duration: 3500,
      centered: true,
    );
  }
}
