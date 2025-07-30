import 'package:dialymath/constans/colors.dart';
import 'package:dialymath/widgets/coustms_widgets/coustm_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoustmBt extends StatelessWidget {
  const CoustmBt(
      {super.key, this.ontab, required this.bttext, this.isload = false});
  final void Function()? ontab;
  final String bttext;
  final bool isload;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontab,
      child: Container(
        height: 40.h,
        width: 110.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: -15.r,
                blurRadius: 80.r,
                color: const Color.fromARGB(255, 0, 0, 0),
              )
            ],
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(colors: [
              Appcolors.waitheblue,
              Appcolors.waithepurbe,
            ])),
        child: Center(
            child: isload
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                        strokeWidth: 2.5, color: Appcolors.white))
                : CoustmText(
                    text: bttext, textsize: 15, textcolor: Appcolors.white)),
      ),
    );
  }
}

class CoustmBticon extends StatelessWidget {
  const CoustmBticon(
      {super.key,
      this.ontab,
      required this.icon,
      required this.width,
      required this.height});
  final void Function()? ontab;
  final IconData icon;
  final double width, height;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: -10.r,
                  blurRadius: 28.r,
                  color: const Color.fromARGB(255, 0, 0, 0))
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                colors: [Appcolors.waitheblue, Appcolors.waithepurbe])),
        child: Center(
          child: IconButton(
            onPressed: ontab,
            icon: Icon(
              icon,
              color: Appcolors.white,
            ),
          ),
        ));
  }
}
