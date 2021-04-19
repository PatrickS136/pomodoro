import 'package:flutter/material.dart';
import 'package:pomodoro/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Center(
                child: CircularPercentIndicator(
                  radius: 300.0,
                  lineWidth: 20.0,
                  percent: 0.8,
                  // header: Text("Icon header"),
                  center: Text(
                    "25:00",
                    style: kTimeText,
                  ),
                  backgroundColor: grey,
                  progressColor: lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
