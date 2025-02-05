import 'package:dialymath/widgets/coustms_widgets/day_card.dart';
import 'package:flutter/material.dart';

class Listofgroups extends StatelessWidget {
  const Listofgroups({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: ListView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        children: const [
          CoustmCard(
            bordercolor: Color.fromARGB(255, 37, 3, 160),
            dayname: 'Saturday',
            day: 1,
          ),
          SizedBox(
            height: 30,
          ),
          CoustmCard(
            bordercolor: Color.fromARGB(255, 3, 66, 160),
            dayname: 'Sunday',
            day: 2,
          ),
          SizedBox(
            height: 30,
          ),
          CoustmCard(
            bordercolor: Color.fromARGB(255, 160, 3, 81),
            dayname: 'Monday',
            day: 3,
          ),
          SizedBox(
            height: 30,
          ),
          CoustmCard(
            bordercolor: Color.fromARGB(255, 3, 66, 160),
            dayname: 'Tuesday',
            day: 4,
          ),
          SizedBox(
            height: 30,
          ),
          CoustmCard(
            bordercolor: Color.fromARGB(255, 37, 3, 160),
            dayname: 'Wednesday',
            day: 5,
          ),
          SizedBox(
            height: 30,
          ),
          CoustmCard(
            bordercolor: Color.fromARGB(255, 160, 3, 63),
            dayname: 'Thursday',
            day: 6,
          ),
          SizedBox(
            height: 30,
          ),
          CoustmCard(
            bordercolor: Color.fromARGB(255, 37, 3, 160),
            dayname: 'Friday',
            day: 7,
          ),
        ],
      ),
    );
  }
}
