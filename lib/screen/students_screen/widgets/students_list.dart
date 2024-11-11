import 'package:dialymath/models/group_model.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:dialymath/screen/students_screen/cubit/student_cubit.dart';
import 'package:dialymath/screen/students_screen/widgets/student_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Studentlist extends StatefulWidget {
  const Studentlist({super.key,required this.day,this.group, this.student});
  final int day;
  final GroupModel? group;
  final StudentModel? student;

  @override
  State<Studentlist> createState() => _StudentlistState();
}

class _StudentlistState extends State<Studentlist> {
  @override
  Widget build(BuildContext context) {
        return BlocBuilder<StudentCubit, StudentState>(
      builder: (context, state) {
        return SizedBox(
          child: ListView.builder(
            physics:const BouncingScrollPhysics(),
              itemCount:state.student?.length ?? 0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                 return Studentcard(
                  day: widget.day,
                  group: state.student![index],
                  colorbordertow: const Color.fromARGB(255, 57, 13, 179),
                   );
              }),
        );
        
      },
    );

  }
}


