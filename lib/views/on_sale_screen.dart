import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/on_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/onsalescreen";
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products On Sale"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red[100],
        leading: InkWell(
          child: Icon(IconlyBold.arrowLeft2),
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        childAspectRatio: size.width / (size.height * 0.4),
        children: List.generate(
          16,
          (index) => OnSaleWidget(),
        ),
      ),
    );
  }
}
