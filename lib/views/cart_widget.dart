import 'package:ecomandroid/shared/heart_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ecomandroid/services/utils.dart';
import 'package:flutter/services.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  TextEditingController _quantityTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _quantityTextController.text = "1";
  }

  @override
  void dispose() {
    _quantityTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return GestureDetector(
      onTap: () {},
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
                      "https://scontent.fist2-3.fna.fbcdn.net/v/t39.30808-6/279418699_1464850347300483_3230164680752958616_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Ew--Ep6CB5QAX9irJWt&_nc_ht=scontent.fist2-3.fna&oh=00_AT8tCUMsZPTUQ-2wcPutibse9mY-_3qFlM6wx500UwPU8w&oe=629788A8",
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
                        "Title",
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
                              function: () {},
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
                              function: () {},
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
                          onTap: () {},
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
                          "\$0.29",
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
