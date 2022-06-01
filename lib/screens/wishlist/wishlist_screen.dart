import 'package:ecomandroid/providers/wishlist_provider.dart';
import 'package:ecomandroid/screens/cart/empty_screen.dart';
import 'package:ecomandroid/screens/onsale/on_sale_screen.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../shared/text_widget.dart';
import 'wishlist_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = "/WishlistScreen";
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final wishll = wishlistProvider.wishListItems;
    final wishlistItemList =
        wishlistProvider.wishListItems.values.toList().reversed.toList();
    return wishlistItemList.isEmpty
        ? EmptyScreen(
            title: "Your wishlist is empty",
            subtitle: "Explore more",
            buttonText: "Wish more...",
            imagePath: "images/wishlist.png",
          )
        : Scaffold(
            appBar: AppBar(
                leading: BackWidget(),
                centerTitle: true,
                automaticallyImplyLeading: false,
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  text: 'Wishlist (${wishll.length})',
                  color: Colors.black,
                  isTitle: true,
                  textSize: 22,
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      GlobalMethods.warningDialog(
                        title: "Empty your wishlist ?",
                        subtitle: "Are you sure ?",
                        fct: () {
                          wishlistProvider.clearWishList();
                        },
                        context: context,
                      );
                    },
                    icon: Icon(
                      IconlyBroken.delete,
                      color: Colors.black,
                    ),
                  ),
                ]),
            body: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                  wishll.length,
                  (index) => ChangeNotifierProvider.value(
                        value: wishlistItemList[index],
                        child: WishlistWidget(),
                      )),
            ),
          );
  }
}
