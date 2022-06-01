import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import 'package:ecomandroid/providers/wishlist_provider.dart';

class HeartBTN extends StatelessWidget {
  final String productId;
  final bool? isInWishlist;
  const HeartBTN({
    Key? key,
    required this.productId,
    this.isInWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return GestureDetector(
      onTap: () {
        wishlistProvider.addRemoveProductToWishlist(
          productId: productId,
        );
      },
      child: Icon(
        isInWishlist != null && isInWishlist == true
            ? IconlyBold.heart
            : IconlyLight.heart,
        size: 22,
        color: isInWishlist != null && isInWishlist == true
            ? Colors.red[900]
            : Colors.red[500],
      ),
    );
  }
}
