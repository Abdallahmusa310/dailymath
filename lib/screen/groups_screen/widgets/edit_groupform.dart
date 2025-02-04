import 'package:dialymath/screen/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustm_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Editgroupform extends StatefulWidget {
  const Editgroupform({super.key, required this.day, required this.group});
  final int day;
  final GroupModel group;
  @override
  State<Editgroupform> createState() => _EditgroupformState();
}

class _EditgroupformState extends State<Editgroupform> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  late TextEditingController nameController, gradeController, timeController;
  String? name, grade, time;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.group.groupname);
    gradeController = TextEditingController(text: widget.group.groupgrade);
    timeController = TextEditingController(text: widget.group.grouptime);
  }

  @override
  void dispose() {
    // التأكد من إلغاء الكائنات لتجنب تسريب الموارد
    nameController.dispose();
    gradeController.dispose();
    timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                CloseButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CoustmTextfield(
                    controller: nameController,
                    hinttext: 'group name',
                    onchange: (value) {
                      name = value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                CoustmTextfield(
                  controller: gradeController,
                  hinttext: 'grade',
                  onchange: (value) {
                    grade = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                CoustmTextfield(
                    controller: timeController,
                    hinttext: 'time',
                    onchange: (value) {
                      time = value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoustmBt(
                        bttext: 'Save',
                        ontab: () {
                          widget.group.groupname =
                              name ?? widget.group.groupname;
                          widget.group.groupgrade =
                              grade ?? widget.group.groupgrade;
                          widget.group.grouptime =
                              time ?? widget.group.grouptime;
                          widget.group.save();
                          BlocProvider.of<GroupCubit>(context)
                              .fetchAllGroups(widget.day);
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      width: 5,
                    ),
                    CoustmBt(
                      bttext: 'Cancel',
                      ontab: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
