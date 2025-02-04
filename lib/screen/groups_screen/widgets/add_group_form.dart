import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/screen/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustm_dropdown.dart';
import 'package:dialymath/widgets/coustm_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddGroupForm extends StatefulWidget {
  const AddGroupForm({super.key, required this.day});
  final int day;
  @override
  State<AddGroupForm> createState() => _AddGroupFormState();
}

class _AddGroupFormState extends State<AddGroupForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? name, grade, time;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupCubit, GroupState>(
      builder: (context, state) {
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
                    CoustmTextfield(
                        hinttext: 'groupname',
                        onsave: (value) {
                          name = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CoustmDropdown(
                      onsave: (value) {
                        grade = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CoustmTextfield(
                      hinttext: 'Start time',
                      onsave: (value) {
                        time = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CoustmBt(
                          bttext: 'create group',
                          isload: state is GroupLoading ? true : false,
                          ontab: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              var groupmodel = GroupModel(
                                  groupname: name!,
                                  groupgrade: grade!,
                                  grouptime: time!,
                                  day: widget.day);
                              BlocProvider.of<GroupCubit>(context)
                                  .addGroup(groupmodel);
                            } else {
                              autovalidateMode = AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                        ),
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
      },
    );
  }
}
