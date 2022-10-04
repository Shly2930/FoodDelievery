import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/bloc/app_theme_bloc.dart';
import 'package:fooddelivery/component/app_main_button.dart';
import 'package:fooddelivery/component/small_round_button.dart';
import 'package:fooddelivery/main.dart';

import 'package:fooddelivery/utilities/app_images.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
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
                        color: theme.isDark ? Colors.blue : Colors.white,
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
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
                          cursorColor: Colors.red.shade400,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp("[0-9]"),
                                allow: true),
                          ],
                          decoration: InputDecoration(
                              hintText: 'Enter mobile number',
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
                                  title: 'Continue',
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/homePage");
                                  }))),
                      Padding(
                        padding: const EdgeInsets.only(left: 130, right: 130),
                        child: Row(
                          children: [
                            Text('Switch Theme'),
                            Switch(
                                value: theme.isDark,
                                onChanged: ((val) {
                                  theme.changeTheme();
                                }))
                          ],
                        ),
                      )
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
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
          ),
        ),
      ),
    );
  }
}
