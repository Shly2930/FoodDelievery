import 'package:flutter/material.dart';

class SmallRoundButton extends StatelessWidget {
  const SmallRoundButton({required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.black87)),
      child: Text(
        title,
      ),
    );
  }
}
