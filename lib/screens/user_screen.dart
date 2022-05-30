import 'package:ecomandroid/providers/dark_theme_provider.dart';
import 'package:ecomandroid/screens/viewed_recently/viewed_recently.dart';
import 'package:ecomandroid/screens/wishlist/wishlist_screen.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../shared/list_tiles.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final TextEditingController _addressController = TextEditingController();
  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "Hi,   ",
                style: TextStyle(
                  fontSize: 27,
                  color: Colors.red[900],
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "MyName",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.orange[500],
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("My name is Pressed");
                      },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 2,
            ),
            SizedBox(
              height: 20,
            ),
            ListTiles(
              onPress: () async {
                await _showAddressDialog();
              },
              title: "Address",
              subtitle: "Sub here",
              icon: IconlyBold.location,
            ),
            ListTiles(
              onPress: () {},
              title: "Address",
              subtitle: "Orders",
              icon: IconlyBold.wallet,
            ),
            ListTiles(
              onPress: () {
                Navigator.of(context).pushNamed(WishlistScreen.routeName);
              },
              title: "Wishlist",
              subtitle: "Sub here",
              icon: IconlyBold.heart,
            ),
            ListTiles(
              onPress: () {
                GlobalMethods.navigateTo(
                    context: context,
                    routeName: ViewedRecentlyScreen.routeName);
              },
              title: "Viewed",
              subtitle: "Sub here",
              icon: IconlyBold.location,
            ),
            ListTiles(
              onPress: () {},
              title: "Forget Password",
              subtitle: "Sub here",
              icon: IconlyBold.lock,
            ),
            SwitchListTile(
              title: Text("Theme Change"),
              secondary: Icon(themeState.darkTheme
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onChanged: (bool value) {
                setState(() {
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.darkTheme,
            ),
            ListTiles(
              onPress: () async {
                await GlobalMethods.warningDialog(
                  title: "Sign Out",
                  subtitle: "Do you want to sign out ?",
                  fct: () {},
                  context: context,
                );
              },
              title: "Logout",
              subtitle: "Sub here",
              icon: IconlyBold.logout,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showSignOutDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/warning-sign.png",
              height: 50,
              width: 50,
            ),
            Text("Sign Out?")
          ],
        ),
        content: Text("Do you want to sign out ?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(primary: Colors.red[900]),
            child: Text("Ok"),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddressDialog() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Update"),
        content: TextField(
          controller: _addressController,
          maxLines: 5,
          decoration: InputDecoration(hintText: "Your Address"),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
}
