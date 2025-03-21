import 'package:dialymath/screens/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_bt.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({
    super.key,
    required this.day,
    required this.groupId,
  });
  final int day;
  final int groupId;

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  String? name, phone;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentCubit, StudentState>(
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
                        hinttext: 'Student name',
                        onsave: (value) {
                          name = value;
                        }),
                    const SizedBox(
                      height: 20,
                    ),
                    CoustmTextfield(
                      hinttext: 'phone',
                      onsave: (value) {
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
                        BlocBuilder<StudentCubit, StudentState>(
                          builder: (context, state) {
                            return CoustmBt(
                              bttext: 'Add Student',
                              isload: state is AddStudentLoading ? true : false,
                              ontab: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  var studentmodel = StudentModel(
                                      studentname: name!,
                                      parentrhone: phone!,
                                      idgroup: widget.groupId);
                                  BlocProvider.of<StudentCubit>(context)
                                      .addstudent(studentmodel);
                                } else {
                                  autovalidateMode = AutovalidateMode.always;
                                  setState(() {});
                                }
                              },
                            );
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
