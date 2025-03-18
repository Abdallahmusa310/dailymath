import 'package:dialymath/constans/colors.dart';
import 'package:dialymath/screens/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/screens/students_screen/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Studentlist extends StatefulWidget {
  const Studentlist({
    super.key,
    required this.day,
    required this.groupId,
  });
  final int day;
  final int groupId;

  @override
  State<Studentlist> createState() => _StudentlistState();
}

class _StudentlistState extends State<Studentlist> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Expanded(
          child: BlocBuilder<StudentCubit, StudentState>(
            builder: (context, state) {
              if (state is AddStudentLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              final students = state.student;
              if (students == null || students.isEmpty) {
                return const Center(
                  child: Text('No students found'),
                );
              }
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: students.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return Studentcard(
                      day: widget.day,
                      studentmodel: students[index],
                      colorbordertow: Appcolors.purble,
                    );
                  });
            },
          ),
        ),
      ],
    );
  }
}
