import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          Text(
            "1.59\$",
            style: TextStyle(color: Colors.green[900], fontSize: 20),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "1.99\$",
            style: TextStyle(
              color: Colors.green[900],
              fontSize: 15,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
