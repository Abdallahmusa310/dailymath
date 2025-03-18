import 'package:dialymath/widgets/coustms_widgets/day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Listofgroups extends StatefulWidget {
  const Listofgroups({super.key});

  @override
  State<Listofgroups> createState() => _ListofgroupsState();
}

class _ListofgroupsState extends State<Listofgroups> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Map<String, dynamic>> _days = [
    {'dayname': 'Saturday', 'day': 1},
    {'dayname': 'Sunday', 'day': 2},
    {'dayname': 'Monday', 'day': 3},
    {'dayname': 'Tuesday', 'day': 4},
    {'dayname': 'Wednesday', 'day': 5},
    {'dayname': 'Thursday', 'day': 6},
    {'dayname': 'Friday', 'day': 7},
  ];
  final List<Map<String, dynamic>> _visibleDays = [];

  @override
  void initState() {
    super.initState();
    _addItemsWithAnimation();
  }

  void _addItemsWithAnimation() async {
    for (int i = 0; i < _days.length; i++) {
      await Future.delayed(const Duration(milliseconds: 600));
      _visibleDays.add(_days[i]);
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.w, right: 28.w, bottom: 8.h),
      child: AnimatedList(
        key: _listKey,
        physics: const BouncingScrollPhysics(),
        initialItemCount: _visibleDays.length,
        itemBuilder: (context, index, animation) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SlideTransition(
              position: animation.drive(
                Tween<Offset>(
                        begin: const Offset(1, 0), end: const Offset(0, 0))
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  scale: animation,
                  child: CoustmCard(
                    dayname: _visibleDays[index]['dayname'],
                    day: _visibleDays[index]['day'],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
