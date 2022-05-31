import 'package:ecomandroid/providers/cart_provider.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/price_widget.dart';
import 'package:ecomandroid/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../../shared/heart_btn.dart';
import '../detail/product_detail.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context: context);
    final theme = utils.getTheme;
    Size size = utils.screenSize;
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductModel>(context);
    bool? _isInCart = cartProvider.cartItems.containsKey(productProvider.id);
    return Material(
      color: Colors.red[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetails.routeName,
              arguments: productProvider.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  productProvider.imageUrl,
                  height: size.width * 0.22,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    TextWidget(
                        text: productProvider.isPiece ? "1Piece" : "1KG",
                        color: Colors.black,
                        textSize: 15),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cartProvider.addProductsToCart(
                              productId: productProvider.id,
                              quantity: 1,
                            );
                          },
                          child: Icon(
                            IconlyLight.bag2,
                            color: _isInCart ? Colors.green : Colors.red[900],
                          ),
                        ),
                        HeartBTN(),
                      ],
                    ),
                  ],
                )
              ],
            ),
            PriceWidget(
              salePrice: productProvider.salePrice,
              price: productProvider.price,
              textPrice: "23",
              isOnSale: productProvider.isOnSale,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              productProvider.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const networkImg =
    "https://scontent.fist2-3.fna.fbcdn.net/v/t39.30808-6/279418699_1464850347300483_3230164680752958616_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=y5W1xPcd_EAAX-S8Pl7&_nc_ht=scontent.fist2-3.fna&oh=00_AT-ahBMSog6IKLiovGbfMnnbY7QY0e1zQJC1dpTojPUGCA&oe=62958E68";
