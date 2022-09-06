import 'package:flutter/material.dart';

class AppMainButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  AppMainButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              primary: Colors.red.shade400),
          child: Text(title)),
    );
  }
}
