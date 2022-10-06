import 'package:flutter/material.dart';

class TimerButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  TimerButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.grey.shade500, width: 1.5),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.white),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ));
  }
}
