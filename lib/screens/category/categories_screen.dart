import 'package:ecomandroid/screens/category/categories_widget.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'images/cat/grains.png',
      'catText': 'Grains',
    },
  ];

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(
            6,
            (index) => CategoriesWidget(
              catText: catInfo[index]["catText"],
              imgPath: catInfo[index]["imgPath"],
              color: gridColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
