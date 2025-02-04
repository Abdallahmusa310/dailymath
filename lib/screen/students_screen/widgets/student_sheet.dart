import 'package:dialymath/screen/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/screen/students_screen/widgets/student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentSheet extends StatefulWidget {
  const StudentSheet({
    super.key,
    required this.day,
    required this.groupId,
  });
  final int day;
  final int groupId;

  @override
  State<StudentSheet> createState() => _StudentSheetState();
}

class _StudentSheetState extends State<StudentSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentState>(
      listener: (context, state) {
        if (state is AddStudentFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
        if (state is AddStudentSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: StudentForm(
              day: widget.day,
              groupId: widget.groupId,
            ),
          ),
        );
      },
    );
  }
}
