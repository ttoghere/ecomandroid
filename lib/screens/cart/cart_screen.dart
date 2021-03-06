import 'package:ecomandroid/providers/cart_provider.dart';
import 'package:ecomandroid/screens/cart/empty_screen.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList =
        cartProvider.cartItems.values.toList().reversed.toList();
    return cartItemsList.isEmpty
        ? EmptyScreen(
            title: "title",
            subtitle: "subtitle",
            buttonText: "buttonText",
            imagePath: "images/cart.png")
        : Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: Text(
                "Cart (${cartItemsList.length}) ",
                style: TextStyle(fontSize: 22, color: Colors.black),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                      title: "Empty your cart?",
                      subtitle: "Are you sure?",
                      fct: () {
                        cartProvider.clearCart();
                      },
                      context: context,
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  CheckOutWidget(size: size),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                            value: cartItemsList[index],
                            child: CartWidget(
                              q: cartItemsList[index].quantity,
                            ));
                      },
                      itemCount: cartItemsList.length,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

class CheckOutWidget extends StatelessWidget {
  const CheckOutWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Material(
              color: Colors.red[200],
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Order Now",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
            Spacer(),
            FittedBox(
              child: Text(
                "Total: \$0.258",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
