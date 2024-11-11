import 'package:dialymath/widgets/coustm_bt.dart';
import 'package:dialymath/screen/groups_screen/widgets/add_group_bottom_sheet.dart';
import 'package:dialymath/widgets/coustm_text.dart';
import 'package:dialymath/screen/groups_screen/widgets/group_list.dart';
import 'package:flutter/material.dart';

class Coustmday extends StatefulWidget {
  const Coustmday({
    super.key, required this.dayname,required this.day, 
  });
  final String dayname;
  final int day;

  @override
  State<Coustmday> createState() => _CoustmdayState();
}
class _CoustmdayState extends State<Coustmday> {
  @override
  void initState() {
    //BlocProvider.of<GroupCubit>(context).fetchAllgroups(widget.day);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CoustmBt(
          bttext: 'create group',
          ontab: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                return AddGroupBottomSheet(day: widget.day,);
                });
          }),
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
           Expanded(flex: 10, child: Grouplist(day:widget.day,)),
        
          ],
          
        ),
      ),
    );
  }
}

