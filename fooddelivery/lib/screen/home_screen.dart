import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/model/restaurant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Restaurant> _restroList = <Restaurant>[];

  Future<void> readJson() async {
    final responseString =
        await rootBundle.loadString('assets/files/restroList.json');
    final decodedData = await json.decode(responseString);
    setState(() {
      for (final jsonObject in decodedData["restaurants"]) {
        Restaurant resto = Restaurant.fromJson(jsonObject);
        _restroList.add(resto);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
