import 'package:dialymath/screens/home_screen/widgets/listofdays.dart';
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
                height: 20,
                width: 20,
              ),
              Text(
                ' Daily Math',
                style: TextStyle(fontSize: 30.sp),
              ),
            ],
          ),
          const Expanded(child: ListofDays())
        ],
      ),
    ));
  }
}
