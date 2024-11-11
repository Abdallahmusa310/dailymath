
import 'package:dialymath/widgets/coustm_text.dart';
import 'package:dialymath/screen/students_screen/widgets/students_list.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({
    super.key, required this.dayname,required this.day
  });
  final String dayname;
  final int day;
  @override
  State<Test> createState() => _TestState();
}
class _TestState extends State<Test> {
  @override
  void initState() {
    // BlocProvider.of<GroupCubit>(context).fetchAllstudents();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(flex: 1,),
            Row(children: [
              IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.exit_to_app)),
               CoustmText(
                text: widget.dayname,
                textcolor: Colors.black,
                textsize: 25,
              ),
            ],),
            Expanded (flex: 10, child: Studentlist(day:widget.day, )),
        
          ],
          
        ),
      ),
    );
  }
}

