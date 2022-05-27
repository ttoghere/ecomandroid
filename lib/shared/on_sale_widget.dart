import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context: context);
    final theme = utils.getTheme;
    Size size = utils.screenSize;
    return Material(
      color: Colors.red[100],
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    networkImg,
                    height: size.width * 0.22,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    children: [
                      Text(
                        "26 Yrs",
                        style: TextStyle(color: Colors.red[900], fontSize: 20),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.bag2,
                              color: Colors.red[900],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(
                              IconlyLight.heart,
                              color: Colors.red[900],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              PriceWidget(),
              SizedBox(
                height: 5,
              ),
              Text(
                "Product Title",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const networkImg =
    "https://scontent.fist2-3.fna.fbcdn.net/v/t39.30808-6/279418699_1464850347300483_3230164680752958616_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=y5W1xPcd_EAAX-S8Pl7&_nc_ht=scontent.fist2-3.fna&oh=00_AT-ahBMSog6IKLiovGbfMnnbY7QY0e1zQJC1dpTojPUGCA&oe=62958E68";
