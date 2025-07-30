import 'package:dialymath/constans/colors.dart';
import 'package:dialymath/screens/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:dialymath/screens/groups_screen/widgets/edit_groupsheet.dart';
import 'package:dialymath/screens/students_screen/student_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
    final Uri whatsapp = Uri.parse(group.grouplink!);
    return Slidable(
      startActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
            backgroundColor: Appcolors.purble,
            label: 'edit',
            foregroundColor: Appcolors.white,
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
            backgroundColor: Appcolors.red,
            label: 'delet',
            foregroundColor: Appcolors.white,
            icon: Icons.delete,
            onPressed: (context) async {
              await BlocProvider.of<GroupCubit>(context).deleteGroup(group);
            })
      ]),
      child: Card(
        elevation: 6,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Studentscreen.studentscreen(
                    groupname: 'Group:${group.groupname!}',
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
                    textcolor: Appcolors.balck,
                    textsize: 25,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CoustmText(
                        text: '${group.groupgrade}',
                        textcolor: Appcolors.balck,
                        textsize: 16,
                      ),
                      CoustmText(
                        text: 'start at : ${group.grouptime}',
                        textcolor: Appcolors.balck,
                        textsize: 16,
                      ),
                      Row(
                        children: [
                          const CoustmText(
                            text: 'whatsapp group : ',
                            textcolor: Appcolors.balck,
                            textsize: 16,
                          ),
                          InkWell(
                              onTap: () async {
                                await launchUrl(whatsapp);
                              },
                              child: const FaIcon(
                                FontAwesomeIcons.whatsapp,
                                color: Appcolors.green,
                              )),
                        ],
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
                                groupname: 'Group:${group.groupname!}',
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
