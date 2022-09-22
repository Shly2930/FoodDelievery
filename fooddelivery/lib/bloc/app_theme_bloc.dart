import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/component/app_theme.dart';
part 'app_theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial());

  bool _isDarkTheme = false;
  bool get isDark => _isDarkTheme;

  void changeTheme() {
    _isDarkTheme = !_isDarkTheme;

    // Emit will change the state of our theme (Must use)
    emit(ThemeChanged());
  }
}
