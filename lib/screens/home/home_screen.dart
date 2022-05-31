import 'package:card_swiper/card_swiper.dart';
import 'package:ecomandroid/consts/contss.dart';
import 'package:ecomandroid/services/global_methods.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/feed_items.dart';
import 'package:ecomandroid/screens/onsale/on_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../feeds/feeds_screen.dart';
import '../onsale/on_sale_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static final List<String> offerImages = [
    'images/offres/Offer1.jpg',
    'images/offres/Offer2.jpg',
    'images/offres/Offer3.jpg',
    'images/offres/Offer4.jpg'
  ];
  static List<String> authImagesPaths = [
    'images/landing/buy-on-laptop.jpg',
    'images/landing/buy-through.png',
    'images/landing/buyfood.jpg',
    'images/landing/grocery-cart.jpg',
    'images/landing/grocery-cart.jpg',
    'images/landing/store.jpg',
    'images/landing/vergtablebg.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProducts = productProvider.productList;
    List<ProductModel> productOnSale = productProvider.getOnSaleProducts;
    final Utils utils = Utils(context: context);
    Size size = utils.screenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.width * 0.33,
              child: Swiper(
                autoplay: true,
                itemBuilder: (context, index) => Image.asset(
                  offerImages[index],
                  fit: BoxFit.fill,
                ),
                control: SwiperControl(color: Colors.black),
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.red[900],
                  ),
                ),
                itemCount: offerImages.length,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                  context: context,
                  routeName: OnSaleScreen.routeName,
                );
              },
              child: Text(
                "View All",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: 3,
                  child: Row(
                    children: [
                      Text(
                        "On Sale".toUpperCase(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.25,
                    child: ListView.builder(
                      itemCount:
                          productOnSale.length < 10 ? productOnSale.length : 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ChangeNotifierProvider.value(
                            child: OnSaleWidget(),
                            value: productOnSale[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Our Products",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.red[900],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(FeedsScreen.routeName);
                  },
                  child: Text("Browse All"),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: size.width / (size.height * 0.7),
              children: List.generate(
                allProducts.length < 4 ? allProducts.length : 4,
                (index) {
                  var access = allProducts[index];
                  return ChangeNotifierProvider.value(
                    value: allProducts[index],
                    child: FeedsItems(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
