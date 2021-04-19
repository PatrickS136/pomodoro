import 'package:flutter/material.dart';
import 'package:pomodoro/constants.dart';

class ReusableButton extends StatelessWidget {
  final icon;
  final onPressed;
  ReusableButton({this.icon, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          icon,
          color: grey,
          size: 50,
        ),
        onPressed: onPressed);
  }
}
