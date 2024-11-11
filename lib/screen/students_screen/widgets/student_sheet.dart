import 'package:dialymath/screen/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/screen/students_screen/widgets/student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentSheet extends StatefulWidget {
  const StudentSheet({
    super.key,
    required this.day,
  });
  final int day;

  @override
  State<StudentSheet> createState() => _StudentSheetState();
}

class _StudentSheetState extends State<StudentSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is AddStudentFailure) {
          print('faield${state.errMessage}');
        }
        if (state is AddStudentSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
            absorbing: state is AddStudentLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SingleChildScrollView(
                  child: StudentForm(
                day: widget.day,
              )),
            ));
      },
    );
  }
}
