import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screens/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Editform extends StatefulWidget {
  const Editform({super.key, required this.day, required this.student});
  final int day;
  final StudentModel student;
  @override
  State<Editform> createState() => _EditformState();
}

class _EditformState extends State<Editform> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController? nameController, phoneController;
  String? name, phone;
  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.studentname);
    phoneController = TextEditingController(text: widget.student.parentrhone);
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
                    hinttext: 'Student name',
                    onchange: (value) {
                      name = value;
                    }),
                const SizedBox(
                  height: 20,
                ),
                CoustmTextfield(
                  controller: phoneController,
                  hinttext: 'phone',
                  onchange: (value) {
                    phone = value;
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
                        bttext: 'Save',
                        ontab: () {
                          widget.student.studentname =
                              name ?? widget.student.studentname;
                          widget.student.parentrhone =
                              phone ?? widget.student.parentrhone;
                          widget.student.save();
                          BlocProvider.of<StudentCubit>(context)
                              .fetchAllstudents(widget.student.idgroup);
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
