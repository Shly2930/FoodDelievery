import 'package:flutter/material.dart';
import 'package:fooddelivery/model/restaurant.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({required this.restaurant});
  final Restaurant restaurant;


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      backgroundColor: Colors.black,
      title: Text(this.widget.restaurant.name),
    ));
  }
}
