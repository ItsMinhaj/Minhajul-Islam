import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({
    required this.icon,
    required this.name,
    Key? key,
  }) : super(key: key);

  IconData icon;
  String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(name),
        ],
      ),
    );
  }
}
