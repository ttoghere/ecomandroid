import 'package:ecomandroid/consts/contss.dart';
import 'package:ecomandroid/models/products_model.dart';
import 'package:ecomandroid/providers/product_provider.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/feed_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

class FeedsScreen extends StatefulWidget {
  static const routeName = "/feedsscreen";
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFN = FocusNode();
  @override
  void dispose() {
    _searchFN.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context: context).screenSize;
    final productProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productProvider.productList;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: kBottomNavigationBarHeight,
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Colors.redAccent,
                          width: 1,
                        ),
                      ),
                      hintText: "What is in your mind ?",
                      prefixIcon: Icon(Icons.search),
                      suffix: IconButton(
                        onPressed: () {
                          _searchController.clear();
                          _searchFN.unfocus();
                        },
                        icon: Icon(
                          Icons.close,
                          color: _searchFN.hasFocus
                              ? Colors.red[900]
                              : Colors.blue,
                        ),
                      )),
                ),
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: size.width / (size.height * 0.7),
              children: List.generate(allProducts.length, (index) {
                var access = allProducts[index];
                return ChangeNotifierProvider.value(
                  value: access,
                  child: FeedsItems(
                   
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
