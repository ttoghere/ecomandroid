import 'package:ecomandroid/consts/theme_data.dart';
import 'package:ecomandroid/providers/dark_theme_provider.dart';
import 'package:ecomandroid/shared/bottom_bar.dart';
import 'package:ecomandroid/views/feeds_screen.dart';
import 'package:ecomandroid/views/on_sale_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    darkThemeProvider.setDarkTheme =
        await darkThemeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => darkThemeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: Styles.themeData(
                isDarkTheme: value.darkTheme, context: context),
            home: BottomBarWidget(),
            routes: {
              FeedsScreen.routeName: (context) => FeedsScreen(),
              OnSaleScreen.routeName: (context) => OnSaleScreen(),
            },
          );
        },
      ),
    );
  }
}
