import 'package:ecomandroid/models/wishlist_model.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  Map<String, WishlistModel> _wishListItems = {};
  Map<String, WishlistModel> get wishListItems {
    return {..._wishListItems};
  }

  void addRemoveProductToWishlist({required String productId}) {
    if (_wishListItems.containsKey(productId)) {
      removeOneItem(productId: productId);
    } else {
      _wishListItems.putIfAbsent(
        productId,
        () => WishlistModel(
          id: DateTime.now().toString(),
          productId: productId,
        ),
      );
    }
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _wishListItems.remove(productId);
    notifyListeners();
  }

  void clearWishList() {
    _wishListItems.clear();
    notifyListeners();
  }
}
