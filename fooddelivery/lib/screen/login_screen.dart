import 'package:flutter/material.dart';
import 'package:fooddelivery/component/app_main_button.dart';
import 'package:fooddelivery/component/small_round_button.dart';

import 'package:fooddelivery/utilities/app_images.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
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
                Container(
                  color: Colors.white,
                  child: Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
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
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter mobile number',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Container(
                        child: AppMainButton(
                            title: 'Continue', onPressed: () {}))),
              ],
            ),
          ),
          Container(
            height: 70,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'By Continuing, you agree to our',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      children: [
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            //https://www.zomato.com/policies/terms-of-service/
                            'Terms of Service',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          //https://www.zomato.com/policies/privacy
                          child: Text('Privacy Policy',
                              style: TextStyle(fontSize: 10)),
                        ),
                        MaterialButton(
                          //https://www.zomato.com/policies/
                          onPressed: () {},
                          child: Text('Content Policies',
                              style: TextStyle(fontSize: 10)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}