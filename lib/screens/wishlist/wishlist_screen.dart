import 'package:ecomandroid/screens/on_sale_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../services/utils.dart';
import '../../shared/text_widget.dart';
import 'wishlist_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      appBar: AppBar(
          leading: BackWidget(),
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: TextWidget(
            text: 'Wishlist (2)',
            color: Colors.black,
            isTitle: true,
            textSize: 22,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyBroken.delete,
                color: Colors.black,
              ),
            ),
          ]),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(8, (index) => WishlistWidget()),
      ),
    );
  }
}
