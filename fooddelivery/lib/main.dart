import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fooddelivery/bloc/app_theme_bloc.dart';
import 'package:fooddelivery/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => changeThemeCubit)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeCubit theme = BlocProvider.of<ThemeCubit>(context, listen: true);
    return MaterialApp(
      theme: theme.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
      onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "loginPage",
    );
  }
}

abstract class AppTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontSize: 25,
                color: Colors.black,
              ),
              caption: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
      );

  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: ThemeData.dark().textTheme.copyWith(
              bodyText1: const TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
              caption: const TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
      );
}
