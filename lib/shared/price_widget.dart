import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final double salePrice;
  final double price;
  final String textPrice;
  final bool isOnSale;
  const PriceWidget({
    Key? key,
    required this.salePrice,
    required this.price,
    required this.textPrice,
    required this.isOnSale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double userPrice = isOnSale ? salePrice : price;
    return FittedBox(
      child: Row(
        children: [
          Text(
            "${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}\$",
            style: TextStyle(color: Colors.green[900], fontSize: 20),
          ),
          SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              "${(price * int.parse(textPrice)).toStringAsFixed(2)}\$",
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 15,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
