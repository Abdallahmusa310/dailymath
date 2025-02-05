import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screens/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/screens/students_screen/widgets/navigation_bottomsheet.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:dialymath/screens/students_screen/widgets/edit_Student_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            backgroundColor: const Color.fromARGB(255, 65, 33, 243),
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
            backgroundColor: const Color.fromARGB(255, 223, 28, 28),
            label: 'delet',
            icon: Icons.delete,
            onPressed: (context) => {
                  studentmodel.delete(),
                  BlocProvider.of<StudentCubit>(context)
                      .fetchAllstudents(studentmodel.idgroup),
                })
      ]),
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: 2, color: colorbordertow),
              end: BorderSide(width: 0.5, color: colorbordertow)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: GestureDetector(
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
                    const CoustmText(
                      text: 'Name : ',
                      textcolor: Colors.black,
                      textsize: 25,
                    ),
                    CoustmText(
                      text: studentmodel.studentname,
                      textcolor: Colors.black,
                      textsize: 25,
                    )
                  ]),
                  Row(children: [
                    const CoustmText(
                      text: 'Parent phone :',
                      textcolor: Colors.black,
                      textsize: 25,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
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
                        textcolor: Colors.black,
                        textsize: 25,
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
