import 'package:dialymath/constans/colors.dart';
import 'package:flutter/material.dart';

Widget buildGradientIcon(IconData icon) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return const LinearGradient(
        colors: [Appcolors.waitheblue, Appcolors.waithepurbe],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds);
    },
    child: Icon(icon, color: Colors.white, size: 30),
  );
}
