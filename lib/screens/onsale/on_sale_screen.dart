import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/empty_products.dart';
import 'package:ecomandroid/screens/onsale/on_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../../models/products_model.dart';
import '../../providers/product_provider.dart';

class OnSaleScreen extends StatelessWidget {
  static const routeName = "/onsalescreen";
  const OnSaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> productsOnSale = productProvider.productList;
    Size size = Utils(context: context).screenSize;
    return Scaffold(
      appBar: AppBar(
        title: Text("Products On Sale"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.red[100],
        leading: BackWidget(),
      ),
      body: productsOnSale.isEmpty
          ? EmptyProdWidget(text: "No product on sale yet!\nStay Tuned!")
          : GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.4),
              children: List.generate(
                productsOnSale.length,
                (index) => ChangeNotifierProvider.value(
                  child: OnSaleWidget(),
                  value: productsOnSale[index],
                ),
              ),
            ),
    );
  }
}

class BackWidget extends StatelessWidget {
  const BackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(IconlyBold.arrowLeft2),
      borderRadius: BorderRadius.circular(12),
      onTap: () {
        Navigator.of(context).pop();
      },
    );
  }
}
