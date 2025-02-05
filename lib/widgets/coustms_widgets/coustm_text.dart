import 'package:flutter/material.dart';

class CoustmText extends StatelessWidget {
  const CoustmText(
      {super.key,
      required this.text,
      this.textsize,
      this.textcolor,
      this.decoration});
  final String text;
  final double? textsize;
  final Color? textcolor;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: textcolor,
          fontSize: textsize,
          decoration: decoration,
        ));
  }
}
