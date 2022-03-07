import 'package:flutter/material.dart';
import 'package:minhajul_islam/theme/themes.dart';
import 'package:minhajul_islam/widgets/custom_product_card.dart';

import 'components/category_items.dart';
import 'components/product_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _appBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Our Product",
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  Text("Sort By ˅"),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryItem(icon: Icons.shopping_bag, name: "Cloth's"),
              CategoryItem(icon: Icons.shopping_bag, name: "Electronics"),
              CategoryItem(icon: Icons.shopping_bag, name: "Jwellery"),
            ],
          ),
          SizedBox(height: 20),
          ProductCard(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      title: const Text.rich(
        TextSpan(
          text: "X",
          style: TextStyle(color: Colors.black),
          children: [
            TextSpan(
              text: "E",
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
      centerTitle: true,
      leading: Image.asset(
        "assets/icon/dashboard.png",
      ),
      actions: const [
        Icon(
          Icons.search,
          color: Colors.black,
          size: 30,
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
