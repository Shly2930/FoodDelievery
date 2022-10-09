import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  bool enabled = false;
  TimerButton(
      {required this.title, required this.onPressed, this.enabled = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (Set<MaterialState> states) {
            return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                    color: enabled ? Colors.red : Colors.grey, width: 2));
          }),
        ),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: enabled ? Colors.red : Colors.grey),
        ));
  }
}
