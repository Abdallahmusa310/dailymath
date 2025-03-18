import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dialymath/screens/home_screen/home_screen.dart';
import 'package:dialymath/screens/menu_screen/menu_screen.dart';
import 'package:dialymath/screens/setting_screen/setting_screen.dart';
import 'package:dialymath/widgets/coustms_widgets/build_gradint_icon.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int slectedindex = 1;
  List<Widget> screens = [
    const Setting(),
    const HomeScreen(),
    const Menu(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[slectedindex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.transparent,
        color: Color.fromARGB((255 * 0.1).round(), 110, 74, 74),
        animationDuration: const Duration(milliseconds: 300),
        items: [
          buildGradientIcon(Icons.settings),
          buildGradientIcon(Icons.home),
          buildGradientIcon(Icons.menu),
        ],
        onTap: (i) {
          setState(() {
            slectedindex = i;
          });
        },
      ),
    );
  }
}
