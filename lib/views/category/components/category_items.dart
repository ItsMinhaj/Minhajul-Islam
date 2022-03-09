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
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            name,
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
