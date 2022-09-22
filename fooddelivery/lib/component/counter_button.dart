import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  final String numberOfItem;
  final Function() addItem;
  final Function() removeItem;
  const CounterButton(
      {required this.numberOfItem,
      required this.addItem,
      required this.removeItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 40,
        width: 120,
        color: Colors.amber,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: removeItem,
                icon: Icon(Icons.remove),
              ),
              Text(numberOfItem),
              IconButton(
                onPressed: addItem,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
