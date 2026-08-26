import 'package:flutter/material.dart';
import 'package:nahj/core/colors/app_colors.dart';

class TeacherSignUpScreen extends StatefulWidget {
  const TeacherSignUpScreen({super.key});

  @override
  State<TeacherSignUpScreen> createState() => _TeacherSignUpScreenState();
}

class _TeacherSignUpScreenState extends State<TeacherSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Appcolors.backgroundcolor,
      body: Center(
        child: Text('Teacher Signup Screen'),
      ),
    );
  }
}
