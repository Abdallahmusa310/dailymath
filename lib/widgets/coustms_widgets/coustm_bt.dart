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
                  spreadRadius: -10.r,
                  blurRadius: 28.r,
                  color: Color(0xffa963d7))
            ],
            borderRadius: BorderRadius.circular(8.r),
            gradient: const LinearGradient(
                colors: [Color(0xff407bff), Color(0xff9467dd)])),
        child: Center(
            child: isload
                ? SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ))
                : CoustmText(
                    text: bttext, textsize: 15, textcolor: Colors.white)),
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
        height: height,
        width: width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: -10.r,
                  blurRadius: 28.r,
                  color: const Color(0xffa963d7))
            ],
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                colors: [Color(0xff407bff), Color(0xff9467dd)])),
        child: Center(
          child: IconButton(
            onPressed: ontab,
            icon: Icon(
              icon,
              color: Colors.white,
            ),
          ),
        ));
  }
}
