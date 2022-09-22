part of 'app_theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}
class ThemeChanged extends ThemeState {}
