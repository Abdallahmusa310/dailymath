import 'package:dialymath/screen/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustm_text.dart';
import 'package:dialymath/screen/groups_screen/widgets/edit_groupsheet.dart';
import 'package:dialymath/screen/students_screen/student_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({
    super.key,
    required this.group,
    required this.colorborder,
    required this.day,
  });
  final GroupModel group;
  final Color colorborder;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
            backgroundColor: const Color.fromARGB(255, 65, 33, 243),
            label: 'edit',
            foregroundColor: CupertinoColors.white,
            icon: Icons.edit,
            onPressed: (context) => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Editgroupsheet(
                    day: day,
                    group: group,
                  );
                })),
        SlidableAction(
            backgroundColor: const Color.fromARGB(255, 223, 28, 28),
            label: 'delet',
            foregroundColor: CupertinoColors.white,
            icon: Icons.delete,
            onPressed: (context) {
              group.delete();
              BlocProvider.of<GroupCubit>(context).fetchAllGroups(day);
            })
      ]),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          border: BorderDirectional(
              bottom: BorderSide(width: 2, color: colorborder),
              end: BorderSide(width: 0.5, color: colorborder)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Studentscreen.studentscreen(
                    dayname: "",
                    day: day,
                    groupId: group.id!,
                  );
                });
          },
          child: Column(
            children: [
              ListTile(
                  title: CoustmText(
                    text: group.groupname ?? '',
                    textcolor: Colors.black,
                    textsize: 25,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoustmText(
                        text: '${group.groupgrade}',
                        textcolor: Colors.black,
                        textsize: 16,
                      ),
                      CoustmText(
                        text: 'start at : ${group.grouptime}',
                        textcolor: Colors.black,
                        textsize: 16,
                      ),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: CoustmBticon(
                      icon: Icons.group,
                      height: 40,
                      width: 50,
                      ontab: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return Studentscreen.studentscreen(
                                dayname: "",
                                day: day,
                                groupId: group.id ?? 0,
                              );
                            });
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
