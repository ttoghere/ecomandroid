import 'package:ecomandroid/models/viewed_model.dart';
import 'package:flutter/material.dart';

class ViewedProvider with ChangeNotifier {
  Map<String, ViewedModel> _viewedItems = {};
  Map<String, ViewedModel> get viewedItems {
    return {..._viewedItems};
  }

  void addProductToHistory({required String productId}) {
    _viewedItems.putIfAbsent(
      productId,
      () => ViewedModel(
        id: DateTime.now().toString(),
        productId: productId,
      ),
    );
    notifyListeners();
  }

  void clearHistory() {
    _viewedItems.clear();
    notifyListeners();
  }
}
