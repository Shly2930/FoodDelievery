import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:fooddelivery/model/restaurant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Restaurant> _restroList = <Restaurant>[];

  Future<void> readJson() async {
    print('========');
    final responseString =
        await rootBundle.loadString('assets/files/restroList.json');
    print('responseString');
    final decodedData = await json.decode(responseString);
    print('decoded');

    setState(() {
      for (final jsonObject in decodedData["restaurants"]) {
        Restaurant resto = Restaurant.fromJson(jsonObject);
        _restroList.add(resto);
      }
    });
    print(_restroList);
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index) {
        return Container();
      }),
    );
  }
}
