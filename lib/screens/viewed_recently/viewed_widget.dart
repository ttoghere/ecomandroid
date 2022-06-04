import 'package:ecomandroid/models/viewed_model.dart';
import 'package:ecomandroid/providers/cart_provider.dart';
import 'package:ecomandroid/providers/viewed_provider.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:ecomandroid/screens/detail/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../providers/product_provider.dart';
import '../../services/utils.dart';
import '../../shared/text_widget.dart';

class ViewedRecentlyWidget extends StatefulWidget {
  const ViewedRecentlyWidget({Key? key}) : super(key: key);

  @override
  _ViewedRecentlyWidgetState createState() => _ViewedRecentlyWidgetState();
}

class _ViewedRecentlyWidgetState extends State<ViewedRecentlyWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvider = Provider.of<ProductsProvider>(context);
    final viewedModel = Provider.of<ViewedModel>(context);
    final getCurrentProduct =
        productProvider.findProdById(productId: viewedModel.productId);
    double usedPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    final cartProvider = Provider.of<CartProvider>(context);
    bool? _isInCart = cartProvider.cartItems.containsKey(getCurrentProduct.id);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethods.navigateTo(
              context: context, routeName: ProductDetails.routeName);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              getCurrentProduct.imageUrl,
              fit: BoxFit.fill,
              height: size.width * 0.27,
              width: size.width * 0.25,
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              children: [
                TextWidget(
                  text: getCurrentProduct.title,
                  color: Colors.black,
                  textSize: 24,
                  isTitle: true,
                ),
                const SizedBox(
                  height: 12,
                ),
                TextWidget(
                  text: "\$${usedPrice.toStringAsFixed(2)}",
                  color: Colors.black,
                  textSize: 20,
                  isTitle: false,
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Material(
                borderRadius: BorderRadius.circular(12),
                color: Colors.green,
                child: InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: _isInCart
                        ? null
                        : () {
                            cartProvider.addProductsToCart(
                              productId: getCurrentProduct.id,
                              quantity: 1,
                            );
                          },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        _isInCart ? IconlyBold.plus : Icons.check,
                        color: _isInCart ? Colors.green : Colors.red[900],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
