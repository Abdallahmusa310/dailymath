import 'package:dialymath/widgets/coustm_text.dart';
import 'package:dialymath/screen/students_screen/widgets/students_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dialymath/screen/students_screen/cubit/student_cubit.dart';

class Studentscreen extends StatefulWidget {
  const Studentscreen.studentscreen({
    super.key,
    required this.dayname,
    required this.day,
    required this.groupId,
  });
  final String dayname;
  final int day;
  final int groupId;

  @override
  State<Studentscreen> createState() => _StudentscreenState();
}

class _StudentscreenState extends State<Studentscreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<StudentCubit>(context).fetchAllstudents(widget.groupId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.exit_to_app)),
                CoustmText(
                  text: widget.dayname,
                  textcolor: Colors.black,
                  textsize: 25,
                ),
              ],
            ),
            Expanded(
                flex: 10,
                child: BlocBuilder<StudentCubit, StudentState>(
                  builder: (context, state) {
                    if (state is AddStudentSuccess) {
                      return Studentlist(
                        day: widget.day,
                        groupId: widget.groupId,
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
