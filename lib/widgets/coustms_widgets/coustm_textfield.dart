import 'package:dialymath/constans/colors.dart';
import 'package:flutter/material.dart';

class CoustmTextfield extends StatelessWidget {
  const CoustmTextfield({
    super.key,
    this.hinttext,
    this.onsave,
    this.onchange,
    this.controller,
  });
  final String? hinttext;
  final void Function(String?)? onsave;
  final void Function(String?)? onchange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: TextFormField(
        controller: controller,
        validator: (data) {
          if (data?.isEmpty ?? true) {
            return 'feild is requird';
          } else {
            return null;
          }
        },
        onChanged: onchange,
        onSaved: onsave,
        cursorColor: Appcolors.purble,
        decoration: InputDecoration(
            labelText: hinttext,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Appcolors.purble,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            border: const OutlineInputBorder(
              borderSide: BorderSide(),
            )),
      ),
    );
  }
}
