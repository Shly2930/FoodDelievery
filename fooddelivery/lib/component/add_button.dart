import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({ required this.onPressed});
  
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: 40,
        width: 120,
        color: Colors.amber,
        child: Center(
          child: Container(
            child : Text('Add')
          )))
     
    );
  }
}