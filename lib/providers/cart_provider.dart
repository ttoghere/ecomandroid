import 'package:ecomandroid/models/cart_model.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartModel> _cartItems = {};
  Map<String, CartModel> get cartItems {
    return {..._cartItems};
  }

  void addProductsToCart({required String productId, required int quantity}) {
    _cartItems.putIfAbsent(
        productId,
        () => CartModel(
              id: DateTime.now().toString(),
              productId: productId,
              quantity: quantity,
            ));
    notifyListeners();
  }

  void reduceQuantityByOne({required String productId}) {
    _cartItems.update(
        productId,
        (value) => CartModel(
              id: value.id,
              productId: productId,
              quantity: value.quantity - 1,
            ));
    notifyListeners();
  }

  void increaseQuantityByOne({required String productId}) {
    _cartItems.update(
        productId,
        (value) => CartModel(
              id: value.id,
              productId: productId,
              quantity: value.quantity + 1,
            ));
    notifyListeners();
  }

  void removeOneItem({required String productId}) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
