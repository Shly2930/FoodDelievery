import 'package:flutter/material.dart';
import 'package:fooddelivery/component/small_round_button.dart';

import 'package:fooddelivery/utilities/app_images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Image.asset(AppImages.foodBanner),
              ),
              Positioned(
                  top: 40,
                  right: 20,
                  child: SmallRoundButton(
                      title: 'Skip',
                      onPressed: () {
                        print('Skip Clicked');
                      })),
            ],
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Text(
                  "India's #1 Food Delivery and Dining App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      height: 1.5,
                      color: Colors.grey.shade900),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  Container(
                    child: Text(
                      'Log in or sign up',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        height: 1.5,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                  Expanded(
                    child: new Container(
                        margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ],
              )
            ]),
          ))
        ],
      ),
    );
  }
}
