import 'package:flutter/material.dart';

class ChooseAccountScreen extends StatefulWidget {
  const ChooseAccountScreen({super.key});

  @override
  State<ChooseAccountScreen> createState() => _ChooseAccountScreenState();
}

class _ChooseAccountScreenState extends State<ChooseAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Choose Account Screen'),
      ),
    );
  }
}
