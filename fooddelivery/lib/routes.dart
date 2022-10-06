import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/model/restaurant.dart';
import 'package:fooddelivery/screen/detail_screen.dart';
import 'package:fooddelivery/screen/home_screen.dart';
import 'package:fooddelivery/screen/login/login_bloc/login_bloc.dart';
import 'package:fooddelivery/screen/login/login_screen.dart';
import 'package:fooddelivery/screen/otp_screen.dart';
import 'package:fooddelivery/screen/signup_screen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "loginPage":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: LoginPage(),
                ));
      case "otpPage":
        // String phoneNum = settings.arguments as String;
        return MaterialPageRoute(builder: (context) => OtpPage(phoneNum: "", otp: "",));
      case "signupPage":
        return MaterialPageRoute(builder: (context) => SignupPage());
      case "/homePage":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "detailPage":
        Restaurant restro = settings.arguments as Restaurant;
        return MaterialPageRoute(
            builder: (context) => DetailPage(restaurant: restro));
    }
  }
}
