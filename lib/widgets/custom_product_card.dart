import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhajul_islam/controller/product_controller.dart';
import 'package:minhajul_islam/services/api_services.dart';
import 'package:minhajul_islam/theme/themes.dart';
import 'package:minhajul_islam/views/product_details/product_details.dart';

class CustomProductCard extends StatelessWidget {
  CustomProductCard({
    Key? key,
  }) : super(key: key);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: ApiServices.fetchProductsData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SizedBox(
              height: 280,
              width: double.infinity,
              child: GetX<ProductController>(builder: (controller) {
                return GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 1.4,
                  ),
                  itemCount: controller.dataList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (_) => ProductDetails(
                                productListData: controller.dataList[index])));
                      },
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  height: 100,
                                  image: NetworkImage(controller
                                      .dataList[index].image
                                      .toString()),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color:
                                                Colors.grey.withOpacity(0.4)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: const [
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.blue,
                                            ),
                                            Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          color: bgColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  children: [
                                    Text(
                                      controller.dataList[index].title
                                          .toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  controller.dataList[index].category
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\$" +
                                          controller.dataList[index].price
                                              .toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          },
        )
      ],
    );
  }
}
