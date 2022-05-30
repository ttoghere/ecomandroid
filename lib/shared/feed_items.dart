import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/heart_btn.dart';
import 'package:ecomandroid/shared/price_widget.dart';
import 'package:ecomandroid/shared/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FeedsItems extends StatefulWidget {
  const FeedsItems({Key? key}) : super(key: key);

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
                "https://scontent.fist2-3.fna.fbcdn.net/v/t39.30808-6/279418699_1464850347300483_3230164680752958616_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Ew--Ep6CB5QAX9irJWt&_nc_ht=scontent.fist2-3.fna&oh=00_AT8tCUMsZPTUQ-2wcPutibse9mY-_3qFlM6wx500UwPU8w&oe=629788A8",
                height: size.width * 0.21,
                width: size.width * 0.21,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.red[900],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    HeartBTN(),
                  ],
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
