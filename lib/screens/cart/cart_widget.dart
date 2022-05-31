import 'package:ecomandroid/screens/detail/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:ecomandroid/models/cart_model.dart';
import 'package:ecomandroid/providers/cart_provider.dart';
import 'package:ecomandroid/providers/product_provider.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/heart_btn.dart';

import '../../models/products_model.dart';

class CartWidget extends StatefulWidget {
  final int q;
  const CartWidget({
    Key? key,
    required this.q,
  }) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  TextEditingController _quantityTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _quantityTextController.text = widget.q.toString();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    final cartModel = Provider.of<CartModel>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    Size size = Utils(context: context).screenSize;
    final getCurrentProduct =
        productProvider.findProdById(productId: cartModel.productId);
    double usedPrice = getCurrentProduct.isOnSale
        ? getCurrentProduct.salePrice
        : getCurrentProduct.price;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProductDetails.routeName,
            arguments: cartModel.productId);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: size.width * 0.25,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.network(
                      getCurrentProduct.imageUrl,
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getCurrentProduct.title,
                        style: TextStyle(
                          color: Colors.red[900],
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: size.width * 0.3,
                        child: Row(
                          children: [
                            QuantityController(
                              function: () {
                                if (_quantityTextController.text == "1") {
                                  return;
                                } else {
                                  cartProvider.reduceQuantityByOne(
                                      productId: cartModel.productId);
                                  setState(() {
                                    _quantityTextController.text = (int.parse(
                                                _quantityTextController.text) -
                                            1)
                                        .toString();
                                  });
                                }
                              },
                              iconData: CupertinoIcons.minus,
                              color: Colors.red[900]!,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextField(
                                controller: _quantityTextController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp("[0-9]"),
                                  ),
                                ],
                                keyboardType: TextInputType.number,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isEmpty) {
                                      _quantityTextController.text = "1";
                                    } else {
                                      return;
                                    }
                                  });
                                },
                              ),
                            ),
                            QuantityController(
                              function: () {
                                cartProvider.increaseQuantityByOne(
                                    productId: cartModel.productId);
                                setState(() {
                                  _quantityTextController.text =
                                      (int.parse(_quantityTextController.text) +
                                              1)
                                          .toString();
                                });
                              },
                              iconData: Icons.add,
                              color: Colors.green[900]!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            cartProvider.removeOneItem(
                                productId: cartModel.productId);
                          },
                          child: Icon(
                            CupertinoIcons.cart_badge_minus,
                            color: Colors.red[900],
                            size: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        HeartBTN(),
                        Text(
                          "\$${usedPrice}",
                          style:
                              TextStyle(color: Colors.red[900], fontSize: 18),
                          maxLines: 1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuantityController extends StatelessWidget {
  final Function function;
  final IconData iconData;
  final Color color;
  const QuantityController({
    Key? key,
    required this.function,
    required this.iconData,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Material(
          color: color,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              function();
            },
            borderRadius: BorderRadius.circular(12),
            child: Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
