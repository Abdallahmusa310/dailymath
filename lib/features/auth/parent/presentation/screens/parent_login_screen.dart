import 'package:flutter/material.dart';
import 'package:nahj/core/theme/app_colors.dart';

class ParentLoginScreen extends StatefulWidget {
  const ParentLoginScreen({super.key});

  @override
  State<ParentLoginScreen> createState() => _ParentLoginScreenState();
}

class _ParentLoginScreenState extends State<ParentLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Appcolors.backgroundcolor,
      body: Center(
        child: Text('Parent Login Screen'),
      ),
    );
  }
}
