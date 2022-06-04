import 'package:ecomandroid/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'consts/theme_data.dart';
import 'firebase_options.dart';
import 'providers/cart_provider.dart';
import 'providers/dark_theme_provider.dart';
import 'providers/product_provider.dart';
import 'providers/viewed_provider.dart';
import 'providers/wishlist_provider.dart';
import 'screens/auth/forget_pass.dart';
import 'screens/auth/login.dart';
import 'screens/auth/register.dart';
import 'screens/category/category_screen.dart';
import 'screens/detail/product_detail.dart';
import 'screens/feeds/feeds_screen.dart';
import 'screens/onsale/on_sale_screen.dart';
import 'screens/viewed_recently/viewed_recently.dart';
import 'screens/wishlist/wishlist_screen.dart';
import 'shared/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(create: (context) => ViewedProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Material App',
            theme: Styles.themeData(
                isDarkTheme: value.darkTheme, context: context),
            home: StreamBuilder(
              stream: firebaseAuth.authStateChanges(),
              builder: (context, AsyncSnapshot<User?> user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return BottomBarWidget();
                }
              },
            ),
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
