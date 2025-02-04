import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screen/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustm_text.dart';
import 'package:dialymath/screen/students_screen/widgets/edit_Student_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final Uri whatsapp =
        Uri.parse('https://wa.me/+02${studentmodel.parentrhone}');
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
                  BlocProvider.of<StudentCubit>(context).fetchAllstudents(studentmodel.idgroup),
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
              ListTile(
                  title: CoustmText(
                    text: studentmodel.studentname,
                    textcolor: Colors.black,
                    textsize: 25,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () async {
                              final Uri uri = Uri(
                                scheme: 'tel',
                                path: studentmodel.parentrhone,
                              );
                              await launchUrl(uri);
                            },
                            icon: const Icon(Icons.call),
                            color: const Color.fromARGB(255, 17, 34, 184),
                          ),
                          Text(studentmodel.parentrhone),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrl(whatsapp);
                        },
                        icon: const FaIcon(FontAwesomeIcons.whatsapp),
                        color: const Color.fromARGB(255, 21, 124, 44),
                      )
                    ],
                  ),
                  trailing: CoustmBticon(
                    icon: Icons.delete,
                    height: 40,
                    width: 50,
                    ontab: () {
                      studentmodel.delete();
                      BlocProvider.of<StudentCubit>(context)
                          .fetchAllstudents(studentmodel.idgroup);
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}


              //  final Uri uri = Uri(
              //         scheme: 'tel',
              //         path: group.studentnumper,
              //       );
              //       await launchUrl(uri);