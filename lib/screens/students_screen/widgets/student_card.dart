import 'package:dialymath/constans/colors.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screens/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/screens/students_screen/widgets/navigation_bottomsheet.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:dialymath/screens/students_screen/widgets/edit_student_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Studentcard extends StatelessWidget {
  const Studentcard(
      {super.key,
      required this.colorbordertow,
      required this.studentmodel,
      required this.day});
  final Color colorbordertow;
  final StudentModel studentmodel;
  final int day;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
            backgroundColor: Appcolors.purble,
            label: 'edit',
            icon: Icons.edit,
            onPressed: (context) => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Editsheet(
                    day: day,
                    student: studentmodel,
                  );
                })),
        SlidableAction(
            backgroundColor: Appcolors.red,
            label: 'delet',
            icon: Icons.delete,
            onPressed: (context) => {
                  studentmodel.delete(),
                  BlocProvider.of<StudentCubit>(context)
                      .fetchAllstudents(studentmodel.idgroup),
                })
      ]),
      child: Container(
        padding: EdgeInsets.only(top: 24.h, bottom: 24.h, left: 16.w),
        decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: 2.r, color: colorbordertow),
              end: BorderSide(width: 0.5.r, color: colorbordertow)),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Editsheet(
                    day: day,
                    student: studentmodel,
                  );
                });
          },
          child: Column(
            children: [
              Column(
                children: [
                  Row(children: [
                    Expanded(
                      child: CoustmText(
                        text: 'Name : ',
                        textcolor: Appcolors.balck,
                        textsize: 25.sp,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r)),
                              ),
                              context: context,
                              builder: (context) {
                                return NavigationBottomsheet(
                                  student: studentmodel,
                                );
                              });
                        },
                        child: CoustmText(
                          text: studentmodel.studentname,
                          decoration: TextDecoration.underline,
                          textcolor: Appcolors.balck,
                          textsize: 25.sp,
                        ),
                      ),
                    )
                  ]),
                  Row(children: [
                    Expanded(
                      child: CoustmText(
                        text: 'Parent phone : ',
                        textcolor: Appcolors.balck,
                        textsize: 25.sp,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.r),
                                    topRight: Radius.circular(15.r)),
                              ),
                              context: context,
                              builder: (context) {
                                return NavigationBottomsheet(
                                  student: studentmodel,
                                );
                              });
                        },
                        child: CoustmText(
                          text: studentmodel.parentrhone,
                          decoration: TextDecoration.underline,
                          textcolor: Appcolors.balck,
                          textsize: 25.sp,
                        ),
                      ),
                    )
                  ])
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
