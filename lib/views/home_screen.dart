import 'package:card_swiper/card_swiper.dart';
import 'package:ecomandroid/services/utils.dart';
import 'package:ecomandroid/shared/on_sale_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dark_theme_provider.dart';

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
    final Utils utils = Utils(context: context);
    Size size = utils.screenSize;
    final themeState = utils.getTheme;

    return Scaffold(
      body: Column(
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
          OnSaleWidget(),
        ],
      ),
    );
  }
}
