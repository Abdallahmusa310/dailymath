import 'package:dialymath/widgets/coustms_widgets/coustm_bt.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: InkWell(
              onTap: () {},
              child:
                  const CoustmBticon(icon: Icons.add, width: 30, height: 60))),
      body: const Column(),
    );
  }
}
