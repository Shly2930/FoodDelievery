// To parse this JSON data, do
//
//     final restaurant = restaurantFromJson(jsonString);

import 'dart:convert';

import 'package:fooddelivery/model/menu.dart';

Restaurant restaurantFromJson(String str) =>
    Restaurant.fromJson(json.decode(str));

String restaurantToJson(Restaurant data) => json.encode(data.toJson());

class Restaurant {
  Restaurant({
    required this.name,
    required this.type,
    required this.rating,
    required this.distance,
    required this.image,
    required this.restaurantId,
    required this.budgetHint,
    required this.menu,
  });

  String name;
  String type;
  double rating;
  String distance;
  String image;
  String restaurantId;
  String budgetHint;
  List<Menu> menu;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        name: json["name"],
        type: json["type"],
        rating: json["rating"].toDouble(),
        distance: json["distance"],
        image: json["image"],
        restaurantId: json["restaurantID"],
        budgetHint: json["budgetHint"],
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "rating": rating,
        "distance": distance,
        "image": image,
        "restaurantID": restaurantId,
        "budgetHint": budgetHint,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}
