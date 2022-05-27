import 'package:ecomandroid/providers/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Utils {
  BuildContext context;
  Utils({required this.context});
  bool get getTheme => Provider.of<DarkThemeProvider>(context).darkTheme;
  Color get color => getTheme ? Colors.white : Colors.black;
}
