import 'package:dialymath/constans/colors.dart';
import 'package:dialymath/screens/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_bt.dart';
import 'package:dialymath/screens/groups_screen/group_screen.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustmCard extends StatelessWidget {
  const CoustmCard({super.key, required this.dayname, required this.day});
  final String dayname;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            BlocProvider.of<GroupCubit>(context).fetchAllGroups(day);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Coustmday(dayname: dayname, day: day);
              },
            ));
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 100.w,
              maxHeight: 80.h,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CoustmText(
                        text: dayname,
                        textcolor: Appcolors.balck,
                        textsize: 25.sp,
                      ),
                      CoustmBticon(
                        icon: Icons.calendar_month_outlined,
                        height: 40.h,
                        width: 50.w,
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}


     // padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      // decoration: BoxDecoration(
      //   border: BorderDirectional(
      //       bottom: BorderSide(width: 2.w, color: Appcolors.purble),
      //       end: BorderSide(width: 0.5.w, color: Appcolors.purble)),
      //   borderRadius: BorderRadius.circular(16.r),
      // ),
