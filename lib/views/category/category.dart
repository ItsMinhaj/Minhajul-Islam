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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: _appBar(),
        body: Column(
          children: [
            const SizedBox(height: 12),
            const CategoryPageTitle(),
            const SizedBox(height: 10),

            SizedBox(
              child: TabBar(
                  indicatorColor: Colors.transparent,
                  isScrollable: true,
                  tabs: [
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
                  ]),
            ),
            const SizedBox(height: 20),

            Expanded(
              child: TabBarView(children: [
                MensClothingCard(),
                WomensClothingCard(),
                ElectronicProductCard(),
                JeweleryProductCard(),
              ]),
            )
            //   ElectronicProductCard(),
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
      ],
    );
  }
}
