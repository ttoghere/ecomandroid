import 'package:badges/badges.dart';
import 'package:ecomandroid/shared/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/users/user_screen.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  final List<Map<String, dynamic>> _screens = [
    {"page": HomeScreen(), "title": "Home "},
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": CartScreen(), "title": "Cart "},
    {"page": UserScreen(), "title": "User "},
  ];

  int _selectedIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          _screens[_selectedIndex]["title"],
        ),
      ),
      body: _screens[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        selectedItemColor: Colors.red[900],
        unselectedItemColor: Colors.blue[600],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 1 ? IconlyBold.category : IconlyLight.category,
            ),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Badge(
              shape: BadgeShape.square,
              badgeColor: Colors.red[200]!,
              borderRadius: BorderRadius.circular(8),
              position: BadgePosition.topEnd(
                top: -7,
                end: -7,
              ),
              badgeContent: FittedBox(
                  child:
                      TextWidget(text: "1", color: Colors.white, textSize: 10)),
              child: Icon(
                _selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy,
              ),
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2,
            ),
            label: "User",
          ),
        ],
      ),
    );
  }
}
