import 'package:ecomandroid/providers/cart_provider.dart';
import 'package:ecomandroid/providers/wishlist_provider.dart';
import 'package:ecomandroid/shared/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/heart_btn.dart';
import 'package:ecomandroid/shared/price_widget.dart';
import 'package:ecomandroid/screens/detail/product_detail.dart';
import 'package:provider/provider.dart';

import '../../consts/firebase_consts.dart';
import '../../models/products_model.dart';
import '../../services/global_methods.dart';

class FeedsItems extends StatefulWidget {
  @override
  State<FeedsItems> createState() => _FeedsItemsState();
}

class _FeedsItemsState extends State<FeedsItems> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvider = Provider.of<ProductModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    bool? _isInCart = cartProvider.cartItems.containsKey(productProvider.id);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    bool? _isWishlist =
        wishlistProvider.wishListItems.containsKey(productProvider.id);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetails.routeName,
                arguments: productProvider.id);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.network(
                productProvider.imageUrl,
                height: size.width * 0.21,
                width: size.width * 0.21,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          text: productProvider.title,
                          color: Colors.black,
                          textSize: 18),
                      SizedBox(
                        width: 5,
                      ),
                      HeartBTN(
                        productId: productProvider.id,
                        isInWishlist: _isWishlist,
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: PriceWidget(
                        salePrice: productProvider.salePrice,
                        price: productProvider.price,
                        textPrice: _quantityTextController.text,
                        isOnSale: productProvider.isOnSale,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            flex: 6,
                            child: FittedBox(
                              child: Text(
                                productProvider.isPiece ? "Piece" : "Kg",
                                style: TextStyle(
                                  color: Colors.red[900],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _quantityTextController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        key: ValueKey("10"),
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 18,
                        ),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        enabled: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
                onPressed: _isInCart
                    ? null
                    : () {
                        final User? user = firebaseAuth.currentUser;
                        if (user == null) {
                          GlobalMethods.errDialog(
                            title: "No user found please login first",
                            subtitle: "No log here",
                            context: context,
                          );
                          return;
                        }
                        cartProvider.addProductsToCart(
                          productId: productProvider.id,
                          quantity: int.parse(_quantityTextController.text),
                        );
                      },
                child: Text(
                  _isInCart ? "In Cart" : "Add to cart",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
