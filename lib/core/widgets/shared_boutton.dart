import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nahj/core/theme/textstyle_extntion.dart';

class Sharedboutton extends StatelessWidget {
  const Sharedboutton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    this.bordercolor,
    this.colortext,
    this.borderRadius,
    this.width,
    this.height,
    this.isLoading = false,
    this.fontsize,
  });
  final String text;
  final double? width, height, borderRadius;
  final void Function()? onTap;
  final bool isLoading;
  final Color color;
  final Color? colortext, bordercolor;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: height ?? 50.h,
        width: width ?? 316.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          border: Border.all(
            color: bordercolor ?? Colors.transparent,
            width: 1.5.w,
          ),
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
                  width: 22.w,
                  height: 22.h,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ),
                )
              : Text(
                  text,
                  style: const TextStyle().appFont.copyWith(
                        fontSize: fontsize ?? 18.sp,
                        fontWeight: FontWeight.bold,
                        color: colortext ?? Colors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
