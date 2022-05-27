import 'package:ecomandroid/providers/dark_theme_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
              onPress: () {},
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
              onPress: () {},
              title: "Wishlist",
              subtitle: "Sub here",
              icon: IconlyBold.heart,
            ),
            ListTiles(
              onPress: () {},
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
              onPress: () {},
              title: "Logout",
              subtitle: "Sub here",
              icon: IconlyBold.logout,
            ),
          ],
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function onPress;
  const ListTiles({
    Key? key,
    required this.onPress,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPress,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Subtitle Here"),
      leading: Icon(icon),
      trailing: Icon(IconlyLight.arrowRight2),
    );
  }
}
