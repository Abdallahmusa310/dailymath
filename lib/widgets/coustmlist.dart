// import 'package:dialymath/cubits/cubit/cubit/add_group_cubit.dart';
// import 'package:dialymath/cubits/cubit/cubit/new_cubit.dart';
// import 'package:dialymath/widgets/coustm_text.dart';
// import 'package:dialymath/widgets/group_list.dart';
// import 'package:dialymath/widgets/list_of%20students.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Coustmlist extends StatefulWidget {
//   const Coustmlist({
//     super.key, 
//   });

//   @override
//   State<Coustmlist> createState() => _CoustmlistState();
// }

// class _CoustmlistState extends State<Coustmlist> {
//   @override
//   void initState() {
//     BlocProvider.of<NewCubit>(context).fetchallstudents(
 
//     );
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:const EdgeInsets.only(top: 60, right: 14,left: 14),
//       child: Column(
//         children: [
//           Row(
//               children: [
//                   IconButton(onPressed: (){Navigator.pop(context);}, icon:const Icon(Icons.exit_to_app)),
//                const  CoustmText(
//                     text: 'list',
//                     textcolor: Colors.black,
//                     textsize: 25,
//                   ),
//                 ],
//           ),
//           const Expanded(child:ListOfstudents())
    
//         ],
//       ),
//     );
//   }
// }