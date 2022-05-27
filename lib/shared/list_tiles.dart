import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ListTiles extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPress;
  const ListTiles({
    Key? key,
    required this.onPress,
    required this.title,
    required this.subtitle,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text("Subtitle Here"),
      leading: Icon(icon),
      trailing: Icon(IconlyLight.arrowRight2),
    );
  }
}
