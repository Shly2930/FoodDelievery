import 'package:flutter/material.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/model/menu.dart';

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
      ),
      body: ListView.separated(
        itemCount: this.widget.restaurant.menu.length,
        itemBuilder: ((context, index) {
          return MenuCard(menu: this.widget.restaurant.menu[index]);
        }),
        separatorBuilder: (context, index) {
          return Divider(
            height: 2.0,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard({required this.menu});

  final Menu menu;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    height: 140,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover,
                        image: NetworkImage(menu.itemUrl),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 25,
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    menu.itemName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(menu.price.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(menu.description, style: TextStyle(fontSize: 15)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
