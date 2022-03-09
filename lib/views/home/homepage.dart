import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minhajul_islam/theme/themes.dart';
import 'package:minhajul_islam/views/category/category.dart';

import 'package:minhajul_islam/views/home/custom_product_card.dart';
import 'package:minhajul_islam/widgets/custome_title.dart';
import 'package:minhajul_islam/widgets/popular_categories.dart';
import 'package:minhajul_islam/widgets/search_box.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int navIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: bgColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SearchBox(),
            const CustomTitleName(title: "Daily Deals"),
            const SizedBox(height: 20),
            CustomProductCard(),
            const SizedBox(height: 20),
            const CustomTitleName(title: "Popular Categories"),
            const SizedBox(height: 20),
            BuildPopularCategories(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(Icons.home),
          Icon(
            Icons.mic,
            color: Colors.white,
          ),
          Icon(Icons.shopping_cart_outlined)
        ],
        height: 60,
        buttonBackgroundColor: Colors.orangeAccent,
        backgroundColor: Colors.transparent,
        index: navIndex,

        //other params
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/icon/hand_wave.png"),
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
          onPressed: () {
            Navigator.of(context).push(
                CupertinoPageRoute(builder: (_) => const CategoryScreen()));
          },
          icon: const Icon(Icons.menu),
          color: Colors.grey,
        )
      ],
    );
  }
}
