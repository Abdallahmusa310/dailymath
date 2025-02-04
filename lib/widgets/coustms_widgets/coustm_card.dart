import 'package:dialymath/screens/groups_screen/cubit/group_cubit.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_bt.dart';
import 'package:dialymath/screens/groups_screen/group_screen.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoustmCard extends StatelessWidget {
  const CoustmCard(
      {super.key,
      required this.bordercolor,
      required this.dayname,
      required this.day});
  final Color bordercolor;
  final String dayname;
  final int day;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        border: BorderDirectional(
            bottom: BorderSide(width: 2, color: bordercolor),
            end: BorderSide(width: 0.5, color: bordercolor)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: () {
          //TODO: fetch all groups of a day before
          //TODO: navigating to that day page
          BlocProvider.of<GroupCubit>(context).fetchAllGroups(day);
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return Coustmday(dayname: dayname, day: day);
            },
          ));
        },
        child: Column(
          children: [
            ListTile(
                title: CoustmText(
                  text: dayname,
                  textcolor: Colors.black,
                  textsize: 25,
                ),
                subtitle: const Column(
                  children: [],
                ),
                trailing: const CoustmBticon(
                  icon: Icons.calendar_month_outlined,
                  height: 40,
                  width: 50,
                ))
          ],
        ),
      ),
    );
  }
}
