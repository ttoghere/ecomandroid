import 'package:ecomandroid/services/dark_theme_prefs.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;
  set setDarkTheme(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkTheme(value: value);
    notifyListeners();
  }
}
