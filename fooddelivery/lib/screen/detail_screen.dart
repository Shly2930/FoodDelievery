import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fooddelivery/component/add_button.dart';
import 'package:fooddelivery/component/counter_button.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/model/menu.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({required this.restaurant});
  final Restaurant restaurant;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Menu> _cart = [];
  int _totalPrice = 0;
  addItem(Menu menu) {
    _cart.add(menu);
    updateCartPrice();

    setState(() {});
  }

  removeItem(Menu menu) {
    _cart.remove(menu);
    updateCartPrice();
    setState(() {});
  }

  int getItemFromCart(Menu menu) {
    int counter = 0;
    for (final item in _cart) {
      if (menu == item) {
        counter = counter + 1;
      }
    }
    return counter;
  }

  updateCartPrice() {
    _totalPrice = 0;
    for (final item in _cart) {
      _totalPrice = _totalPrice + item.price;
    }

    return _totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(this.widget.restaurant.name),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: this.widget.restaurant.menus.length,
              itemBuilder: ((context, index) {
                final menuItem = this.widget.restaurant.menus[index];
                return MenuCard(
                    menu: menuItem,
                    addItem: () {
                      addItem(menuItem);
                    },
                    numberOfItem: getItemFromCart(menuItem).toString(),
                    removeItem: () {
                      removeItem(menuItem);
                    });
              }),
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2.0,
                  color: Colors.grey,
                );
              },
            ),
          ),
          SizedBox(
            height: _totalPrice == 0 ? 0 : 80,
            child: Container(
              height: 80,
              color: Colors.amber,
              child: Center(
                  child: Text(
                'Total Price ${_totalPrice}',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  const MenuCard(
      {required this.menu,
      required this.numberOfItem,
      required this.addItem,
      required this.removeItem});
  final Menu menu;

  final String numberOfItem;
  final Function() addItem;
  final Function() removeItem;

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
                      top: 110,
                      left: 15,
                      child: CounterButton(
                        numberOfItem: numberOfItem,
                        removeItem: removeItem,
                        addItem: addItem,
                      )),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      menu.itemName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(menu.price.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(menu.description, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
