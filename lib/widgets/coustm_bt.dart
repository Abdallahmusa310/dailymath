import 'package:dialymath/widgets/coustm_text.dart';
import 'package:flutter/material.dart';

class CoustmBt extends StatelessWidget {
  const CoustmBt({super.key, this.ontab, required this.bttext,this.isload=false});
  final void Function()?ontab;
  final String bttext;
  final bool isload;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        height: 40,
            width: 110,
            decoration: BoxDecoration(
              boxShadow:const [
                 BoxShadow(
                   spreadRadius:-10,
                  blurRadius: 28,
                  color: Color(0xffa963d7)
                 )
              ],
              borderRadius: BorderRadius.circular(8),
              gradient:
              const LinearGradient(colors:
               [
                Color(0xff407bff),
                Color(0xff9467dd)
               ]
               )
            ),
            child:Center(
            child: isload ? const SizedBox(width:20,height: 20,
            child:CircularProgressIndicator(strokeWidth: 2.5,color: Colors.white,)) :
            CoustmText(text: bttext, textsize: 15, textcolor: Colors.white)) ,
      ),
    );
  }
}


class CoustmBticon extends StatelessWidget {
  const CoustmBticon({super.key, this.ontab,  required this.icon, required this.width, required this.height});
  final void Function()?ontab;
  final IconData icon;
  final double width,height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
          width: width,
          decoration: BoxDecoration(
            boxShadow:const [
               BoxShadow(
                 spreadRadius:-10,
                blurRadius: 28,
                color: Color(0xffa963d7)
               )
            ],
            borderRadius: BorderRadius.circular(8),
            gradient:
            const LinearGradient(colors:
             [
              Color(0xff407bff),
              Color(0xff9467dd)
             ]
             )
          ),
          child:Center(child:IconButton(onPressed: ontab, icon: Icon(icon,color: Colors.white,),) ,
          )
    );
  }
}