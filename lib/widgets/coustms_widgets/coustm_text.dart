import 'package:flutter/material.dart';

class CoustmText extends StatelessWidget {
  const CoustmText({super.key, required this.text, required this.textsize, required this.textcolor});
  final String text;
  final double textsize;
  final Color textcolor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textcolor,
        fontSize: textsize
      ),
      );
  }
}