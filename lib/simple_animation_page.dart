import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SimpleAnimation extends StatelessWidget {
  const SimpleAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: RiveAnimation.asset(
          'assets/ani/example__basketball.riv',
        ),
      ),
    );
  }
}