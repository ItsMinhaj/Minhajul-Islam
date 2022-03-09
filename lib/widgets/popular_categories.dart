import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minhajul_islam/data/popular_category.dart';
import 'package:minhajul_islam/views/category/category.dart';

class BuildPopularCategories extends StatelessWidget {
  const BuildPopularCategories({Key? key}) : super(key: key);

  final index = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Expanded(
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 0.5,
          ),
          itemCount: popularCategory.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const CategoryScreen()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken),
                        image: NetworkImage(
                          popularCategory[index]["img"].toString(),
                        ),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20,
                          top: 50,
                          child: Text(
                            popularCategory[index]["category-name"].toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
