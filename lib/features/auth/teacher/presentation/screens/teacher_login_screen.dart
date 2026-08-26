import 'package:flutter/material.dart';
import 'package:nahj/core/colors/app_colors.dart';

class TeacherLoginScreen extends StatefulWidget {
  const TeacherLoginScreen({super.key});

  @override
  State<TeacherLoginScreen> createState() => _TeacherLoginScreenState();
}

class _TeacherLoginScreenState extends State<TeacherLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Appcolors.backgroundcolor,
      body: Center(
        child: Text('Teacher Login Screen'),
      ),
    );
  }
}
