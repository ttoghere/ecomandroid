import 'package:ecomandroid/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/heart_btn.dart';
import 'package:ecomandroid/shared/price_widget.dart';
import 'package:ecomandroid/shared/product_detail.dart';

class FeedsItems extends StatefulWidget {
  final String imageUrl;
  final String title;
  const FeedsItems({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  State<FeedsItems> createState() => _FeedsItemsState();
}

class _FeedsItemsState extends State<FeedsItems> {
  final _quantityTextController = TextEditingController();
  @override
  void initState() {
    _quantityTextController.text = "1";
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetails.routeName);
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              Image.network(
                widget.imageUrl,
                height: size.width * 0.21,
                width: size.width * 0.21,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          text: widget.title,
                          color: Colors.black,
                          textSize: 18),
                      SizedBox(
                        width: 5,
                      ),
                      HeartBTN(),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: PriceWidget(
                      salePrice: 2.99,
                      price: 5.9,
                      textPrice: _quantityTextController.text,
                      isOnSale: true,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        FittedBox(
                          child: Text(
                            "Kg",
                            style: TextStyle(
                              color: Colors.red[900],
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _quantityTextController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      key: ValueKey("10"),
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 18,
                      ),
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      enabled: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9.]"))
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Add to cart",
                  maxLines: 1,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
