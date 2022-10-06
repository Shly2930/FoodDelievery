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
            side: const BorderSide(color: Colors.grey, width: 2.0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.white),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        ));
  }
}
