
import 'package:dialymath/widgets/listofgroups.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(
          top: 70,
          left: 8,
          right: 8
        ),
        child: Column(
          children: [
            Row(children:
             [
             Image.asset('assets/p1.png',width:50,height:50,),
             const Text(' Daily Math',style: TextStyle(fontSize: 30),),
             ],
             ),
              const Expanded(child:Listofgroups())
            
          ],
        ),
      )
    );
      

           
    
  }
}



// Column(
//           children: [
//             Row(children:
//              [
//              Image.asset('assets/p1.png',width:50,height:50,),
//              const Text(' Daily Math',style: TextStyle(fontSize: 30),),
//              ],
//              ),
            
//           ],
//         ),


// ody:  Padding(
//         padding:EdgeInsets.only(
//         top: 60,
//         right: 14,
//         left: 14
//         ),
//         child: Column(
//           children: [
//           CoustmAppbar(),
//           Expanded(child:Listofdays()),
//           ],
//         ),
//       ),