import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:minhajul_islam/widgets/custom_product_card.dart';
import 'package:minhajul_islam/widgets/custome_title.dart';
import 'package:minhajul_islam/widgets/popular_categories.dart';
import 'package:minhajul_islam/widgets/search_box.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int navIndex = 0;

  List<IconData> iconList = [
    Icons.home,
    Icons.shopping_cart_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            SearchBox(),
            CustomTitleName(title: "Daily Deals"),
            SizedBox(height: 20),
            CustomProductCard(),
            SizedBox(height: 20),
            CustomTitleName(title: "Popular Categories"),
            SizedBox(height: 20),
            BuildPopularCategories(),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: navIndex,
        activeColor: Colors.blue,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (p) {
          setState(() {
            navIndex = p;
          });
        },
        //other params
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: const Icon(
        Icons.clean_hands_outlined,
        color: Colors.yellow,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Good Morning",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          Text(
            "Nicholas",
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.grey,
        )
      ],
    );
  }
}
