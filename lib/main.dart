import 'package:ecomandroid/consts/theme_data.dart';
import 'package:ecomandroid/providers/cart_provider.dart';
import 'package:ecomandroid/providers/dark_theme_provider.dart';
import 'package:ecomandroid/providers/product_provider.dart';
import 'package:ecomandroid/providers/wishlist_provider.dart';
import 'package:ecomandroid/screens/auth/forget_pass.dart';
import 'package:ecomandroid/screens/auth/login.dart';
import 'package:ecomandroid/screens/auth/register.dart';
import 'package:ecomandroid/screens/category/categories_screen.dart';
import 'package:ecomandroid/screens/category/category_screen.dart';
import 'package:ecomandroid/screens/viewed_recently/viewed_recently.dart';
import 'package:ecomandroid/screens/wishlist/wishlist_screen.dart';
import 'package:ecomandroid/shared/bottom_bar.dart';
import 'package:ecomandroid/screens/detail/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/feeds/feeds_screen.dart';
import 'screens/onsale/on_sale_screen.dart';

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
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => darkThemeProvider),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
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
              ProductDetails.routeName: (context) => ProductDetails(),
              WishlistScreen.routeName: (context) => WishlistScreen(),
              ViewedRecentlyScreen.routeName: (context) =>
                  ViewedRecentlyScreen(),
              ForgetPasswordScreen.routeName: (context) =>
                  ForgetPasswordScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              CategoryScreen.routeName: (context) => CategoryScreen(),
            },
          );
        },
      ),
    );
  }
}
