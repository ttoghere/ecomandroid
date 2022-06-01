import 'package:ecomandroid/screens/detail/product_detail.dart';
import 'package:flutter/material.dart';
import '../../services/global_methods.dart';
import '../../services/utils.dart';
import '../../shared/text_widget.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return ListTile(
      subtitle: const Text('Paid: \$12.8'),
      onTap: () {
        GlobalMethods.navigateTo(
            context: context, routeName: ProductDetails.routeName);
      },
      leading: Image.network(
        "https://i.ibb.co/F0s3FHQ/Apricots.png",
        width: size.width * 0.2,
        fit: BoxFit.fill,
      ),
      title: TextWidget(text: 'Title  x12', color: Colors.black, textSize: 18),
      trailing:
          TextWidget(text: '03/08/2022', color: Colors.black, textSize: 18),
    );
  }
}
