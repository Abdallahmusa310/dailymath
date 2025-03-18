import 'package:dialymath/screens/home_screen/widgets/listofgroups.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(top: 70.h, left: 8.w, right: 8.w),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/p2.png',
                width: 50.w,
                height: 50.h,
              ),
              Text(
                ' Daily Math',
                style: TextStyle(fontSize: 30.sp),
              ),
            ],
          ),
          const Expanded(child: Listofgroups())
        ],
      ),
    ));
  }
}
