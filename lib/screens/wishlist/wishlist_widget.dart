import 'package:ecomandroid/models/cart_model.dart';
import 'package:ecomandroid/models/wishlist_model.dart';
import 'package:ecomandroid/providers/product_provider.dart';
import 'package:ecomandroid/providers/wishlist_provider.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:ecomandroid/shared/heart_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../services/utils.dart';
import '../detail/product_detail.dart';
import '../../shared/text_widget.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvider = Provider.of<ProductsProvider>(context);
    final wishlistModel = Provider.of<WishlistModel>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final getCurrentProduct =
        productProvider.findProdById(productId: wishlistModel.productId);
    double usedPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    bool? _isInWishlist =
        wishlistProvider.wishListItems.containsKey(getCurrentProduct.id);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetails.routeName,
              arguments: wishlistModel.productId);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red[200]!,
                Colors.blue[200]!,
                Colors.black12,
              ],
              stops: [0.0, 0.6, 1.0],
            ),
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 8),
                // width: size.width * 0.2,
                height: size.width * 0.25,
                child: Image.network(
                  getCurrentProduct.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              IconlyLight.bag2,
                              color: Colors.black,
                            ),
                          ),
                          HeartBTN(
                            productId: getCurrentProduct.id,
                            isInWishlist: _isInWishlist,
                          )
                        ],
                      ),
                    ),
                    TextWidget(
                      text: getCurrentProduct.title,
                      color: Colors.black,
                      textSize: 20.0,
                      maxLines: 1,
                      isTitle: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: '\$${usedPrice.toStringAsFixed(2)}',
                      color: Colors.black,
                      textSize: 18.0,
                      maxLines: 1,
                      isTitle: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
