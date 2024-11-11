import 'package:dialymath/screen/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screen/students_screen/widgets/edit_student_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Editsheet extends StatefulWidget {
  const Editsheet({super.key, required this.day, required this.student});
  final int day;
  final StudentModel student;
  @override
  State<Editsheet> createState() => _EditsheetState();
}

class _EditsheetState extends State<Editsheet> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentCubit(),
      child: BlocConsumer<StudentCubit, StudentState>(
        listener: (context, state) {
          if (state is AddStudentFailure) {
            print('faield${state.errMessage}');
          }
          if (state is AddStudentSuccess) {
            // BlocProvider.of<GroupCubit>(context).fetchAllgroups(widget.day);
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
                    child: Editform(
                  day: widget.day,
                  student: widget.student,
                )),
              ));
        },
      ),
    );
  }
}
