import 'package:dialymath/constans/colors.dart';
import 'package:dialymath/models/student_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationBottomsheet extends StatelessWidget {
  const NavigationBottomsheet({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    final Uri whatsapp = Uri.parse('https://wa.me/+02${student.parentrhone}');
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(student.studentname),
          IconButton(
            onPressed: () async {
              final Uri uri = Uri(
                scheme: 'tel',
                path: student.parentrhone,
              );
              await launchUrl(uri);
            },
            icon: Row(children: [
              const Icon(Icons.call),
              Text('  : ${student.parentrhone}')
            ]),
            color: Appcolors.purble,
          ),
          IconButton(
            onPressed: () async {
              await launchUrl(whatsapp);
            },
            icon: Row(children: [
              const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Appcolors.green,
              ),
              Text('  : ${student.parentrhone}')
            ]),
            color: Appcolors.purble,
          ),
        ],
      ),
    );
  }
}
