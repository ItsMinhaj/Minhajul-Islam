import 'package:flutter/material.dart';
import 'package:minhajul_islam/theme/themes.dart';
import 'package:minhajul_islam/views/category/electronic-products/electronic_product_card.dart';
import 'package:minhajul_islam/views/category/jewelery-products/jewelery_product_card.dart';

import 'components/category_items.dart';
import 'components/category_page_title.dart';
import 'mens-clothing/mens_clothing_card.dart';
import 'womens-clothing/womens_clothing_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: _appBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const CategoryPageTitle(),
          const SizedBox(height: 20),

          TabBar(
              controller: _tabController,
              indicatorColor: Colors.red,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              tabs: [
                Tab(
                    child: CategoryItem(
                        icon: Icons.shopping_bag, name: "Men Cloth's")),
                Tab(
                    child: CategoryItem(
                        icon: Icons.shopping_bag, name: "Women Cloth's")),
                Tab(
                    child: CategoryItem(
                        icon: Icons.shopping_bag, name: "Electronics")),
                Tab(
                    child: CategoryItem(
                        icon: Icons.shopping_bag, name: "Jwellery")),
              ]),
          const SizedBox(height: 20),

          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              MensClothingCard(),
              WomensClothingCard(),
              ElectronicProductCard(),
              JeweleryProductCard()
            ]),
          )
          //   ElectronicProductCard(),
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
