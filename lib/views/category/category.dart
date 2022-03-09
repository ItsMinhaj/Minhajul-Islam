import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:minhajul_islam/theme/themes.dart';
import 'package:minhajul_islam/views/category/components/category_items.dart';
import 'package:minhajul_islam/views/category/electronic-products/electronic_product_card.dart';
import 'package:minhajul_islam/views/category/jewelery-products/jewelery_product_card.dart';

import 'components/category_page_title.dart';
import 'mens-clothing/mens_clothing_card.dart';
import 'womens-clothing/womens_clothing_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int initialIndex = 2;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBody: true,
        backgroundColor: bgColor,
        appBar: _appBar(),
        body: Column(
          children: [
            const SizedBox(height: 12),
            const CategoryPageTitle(),
            const SizedBox(height: 10),
            const SizedBox(
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabs: [
                    SizedBox(
                        width: 100,
                        child: Tab(
                          child: CategoryItem(
                            icon: Icons.shopping_bag,
                            name: "Electronics",
                          ),
                        )),
                    SizedBox(
                        width: 100,
                        child: Tab(
                            child: CategoryItem(
                          icon: Icons.shopping_bag,
                          name: "Jewelery",
                        ))),
                    SizedBox(
                      width: 70,
                      child: Tab(
                          child: CategoryItem(
                        icon: Icons.shopping_bag,
                        name: "Mens",
                      )),
                    ),
                    SizedBox(
                      width: 80,
                      child: Tab(
                        child: CategoryItem(
                          icon: Icons.shopping_bag,
                          name: "Women",
                        ),
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(children: [
                ElectronicProductCard(),
                JeweleryProductCard(),
                MensClothingCard(),
                WomensClothingCard(),
              ]),
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          buttonBackgroundColor: Colors.indigo,
          backgroundColor: Colors.transparent,
          index: initialIndex,
          items: const [
            Icon(Icons.inbox_rounded),
            Icon(Icons.favorite_outline),
            Icon(Icons.add_shopping_cart, color: Colors.grey),
            Icon(Icons.book_sharp),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: bgColor,
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
