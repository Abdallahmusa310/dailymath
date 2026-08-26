import 'package:flutter/material.dart';
import 'package:nahj/core/colors/app_colors.dart';

class ParentSignupScreen extends StatefulWidget {
  const ParentSignupScreen({super.key});

  @override
  State<ParentSignupScreen> createState() => _ParentSignupScreenState();
}

class _ParentSignupScreenState extends State<ParentSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Appcolors.backgroundcolor,
      body: Center(
        child: Text('Parent Signup Screen'),
      ),
    );
  }
}
