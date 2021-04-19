import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro/constants.dart';
import 'package:pomodoro/components/reusableButton.dart';

class MyTimer extends StatefulWidget {
  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int timeInMinutes;
  double timeInSeconds;
  double percentage;
  int initial;
  bool study;
  bool paused;
  String count;
  var timer;

  String checkTimeLessThanTen(num) {
    if (num < 10) {
      return "0";
    }
    return "";
  }

  void pause() {
    setState(() {
      if (paused == true) {
        tick();
        print("unpause");
      } else {
        timer.cancel();
      }
      paused = !paused;
    });
  }

  void reset() {
    setState(() {
      if (study) {
        initial = 25;
      } else {
        initial = (count.length % 4 == 0) ? 20 : 5;
      }
      timeInMinutes = initial;
      timeInSeconds = 0.0;
      percentage = 0.0;
    });
  }

  void tick() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (timeInSeconds == 0) {
          timeInSeconds = 59;
          timeInMinutes--;
        } else {
          timeInSeconds--;
        }
        if (timeInMinutes == 0 && timeInSeconds == 0) {
          study = !study;
          count += "⭐";
          reset();
        }

        percentage = ((initial * 60) - (timeInMinutes * 60 + timeInSeconds)) /
            (initial * 60);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    timeInSeconds = 0;
    study = true;
    paused = false;
    count = "";
    reset();
    tick();
    pause();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Center(
            child: CircularPercentIndicator(
              radius: 300.0,
              lineWidth: 20.0,
              animation: true,
              header: Column(
                children: [
                  Text(
                    (study == true) ? "💪 Study" : "🍕 Take a break",
                    style: kTimeText.copyWith(
                      fontSize: 45,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    count,
                    style: kChecks,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
              animationDuration: 1200,
              percent: percentage,
              // header: Text("Icon header"),
              animateFromLastPercent: true,
              center: Text(
                "${checkTimeLessThanTen(timeInMinutes)}$timeInMinutes:${checkTimeLessThanTen(timeInSeconds.toInt())}${timeInSeconds.toInt()}",
                style: kTimeText,
              ),
              backgroundColor: grey,
              progressColor: lightBlue,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReusableButton(icon: Icons.refresh, onPressed: reset),
            ReusableButton(
                icon: (paused == false) ? Icons.pause : Icons.play_arrow,
                onPressed: pause),
          ],
        ),
      ],
    );
  }
}
