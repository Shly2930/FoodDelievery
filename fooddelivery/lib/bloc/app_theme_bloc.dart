import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/component/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'app_theme_state.dart';

enum ThemeType { Dark, Light }
// extension ThemeTypeExtension on ThemeType {
//   static const values = {
//     0: ThemeType.Dark,
//     1: ThemeType.Light,
//   };

//   ThemeType? get value => values[this];
// }

ThemeCubit changeThemeCubit = ThemeCubit()..initialThemeSetup();

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDarkTheme = true;
  bool get isDark => _isDarkTheme;

  void initialThemeSetup() async {
    // print("theme setup");
    _isDarkTheme = await getSavedThemeIsDark();
    emit(ThemeChanged());
  }

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;

    saveDarkTheme(_isDarkTheme);
    // Emit will change the state of our theme (Must use)
    emit(ThemeChanged());
  }

  Future<void> saveDarkTheme(bool value) async {
    var preferences = await SharedPreferences.getInstance();
    // print("saved == ${value}");
    await preferences.setBool('theme_option', value);
  }

  Future<bool> getSavedThemeIsDark() async {
    try {
      var preferences = await SharedPreferences.getInstance();
      return preferences.getBool('theme_option') ?? true;
    } catch (e) {
      return true;
    }
  }
}
