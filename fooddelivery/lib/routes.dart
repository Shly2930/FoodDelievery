import 'package:flutter/material.dart';
import 'package:fooddelivery/screen/home_screen.dart';
import 'package:fooddelivery/screen/login_screen.dart';
import 'package:fooddelivery/screen/signup_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "loginPage":
        return MaterialPageRoute(builder: (context) => LoginPage());
      case "signupPage":
        return MaterialPageRoute(builder: (context) => SignupPage());
      // case "homePage":
      //   return MaterialPageRoute(builder: (context) => HomePage());
      case "homePage":
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
