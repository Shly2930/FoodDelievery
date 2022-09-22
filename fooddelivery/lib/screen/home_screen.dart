import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/bloc/app_theme_bloc.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/screen/detail_screen.dart';

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
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView.builder(
        itemCount: _restroList.length,
        itemBuilder: (context, index) {
          return RestroCard(
            restaurant: _restroList[index],
          );
        },
      ),
    );
  }
}

class RestroCard extends StatelessWidget {
  const RestroCard({required this.restaurant});

  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "detailPage", arguments: restaurant);
        },
        child: Container(
          decoration: BoxDecoration(
              color: theme.isDark ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  fit: BoxFit.fitWidth,
                  height: 250,
                  width: double.infinity,
                  image: NetworkImage(restaurant.image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        restaurant.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    RatingView(rating: restaurant.rating.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10, top: 5, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      restaurant.type,
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                    Text(
                      restaurant.budgetHint,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RatingView extends StatelessWidget {
  const RatingView({required this.rating});
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          rating,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Icon(
          Icons.star,
          color: Colors.white,
          size: 12,
        )
      ]),
    );
  }
}
