import 'package:ecomandroid/screens/category/category_screen.dart';
import 'package:flutter/material.dart';
class CategoriesWidget extends StatelessWidget {
  final String catText;
  final String imgPath;
  final Color color;
  const CategoriesWidget({
    Key? key,
    required this.catText,
    required this.imgPath,
    required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(CategoryScreen.routeName, arguments: catText);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.7), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    imgPath,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              catText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
