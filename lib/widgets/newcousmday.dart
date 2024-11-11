// import 'package:dialymath/widgets/coustm_bt.dart';
// import 'package:dialymath/widgets/coustm_day.dart';
// import 'package:dialymath/widgets/coustm_sheet.dart';
// import 'package:flutter/material.dart';

// class Newcoustmday extends StatelessWidget {
//   const Newcoustmday({super.key, required this.dayname, required this.day});
//   final String dayname;
//   final int day;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: CoustmBt(
//           bttext: 'create group',
//           ontab: () {
//             showModalBottomSheet(
//                 isScrollControlled: true,
//                 context: context,
//                 builder: (context) {
//                   return Modelsheet(day: day,);
//                 });
//           }),
//       body:SafeArea(child: Coustmday(dayname: dayname,day: day,)),
//     );
//   }
// }
