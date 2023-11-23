import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  get themeModel => _themeMode;

  toogleTheme(bool isdark) {
    _themeMode = isdark ? ThemeMode.dark : ThemeMode.light;
  }
}
