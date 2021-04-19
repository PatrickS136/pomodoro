import 'package:flutter/material.dart';
import 'package:pomodoro/components/timer.dart';
import 'package:pomodoro/constants.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              darkBlue,
              darkGreen,
            ],
          ),
        ),
        child: MyTimer(),
      ),
    );
  }
}
