import 'package:ecomandroid/screens/feeds/feeds_screen.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/text_widget.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final String imagePath;
  const EmptyScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: size.height * 0.4,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Whoops!!",
                style: TextStyle(
                  color: Colors.red[900],
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextWidget(
                text: "No items in your cart yet",
                color: Colors.black,
                textSize: 22,
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  GlobalMethods.navigateTo(
                      context: context, routeName: FeedsScreen.routeName);
                },
                child: TextWidget(
                  text: "Browse Products",
                  color: Colors.white,
                  textSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
