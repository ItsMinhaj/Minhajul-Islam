import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minhajul_islam/controller/jewelery_controller.dart';
import 'package:minhajul_islam/services/api_services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class JeweleryProductCard extends StatelessWidget {
  JeweleryProductCard({
    Key? key,
  }) : super(key: key);

  JewelerController jewelerController = Get.put(JewelerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GetX<JewelerController>(builder: (controller) {
            return Visibility(
              visible: jewelerController.isLoaded.value,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              height: 100,
                              image: NetworkImage(
                                  controller.products[index].image.toString()),
                            ),
                            const SizedBox(height: 8),
                            const SizedBox(height: 4),
                            Wrap(
                              children: [
                                Text(
                                  controller.products[index].title.toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "\$ " +
                                      controller.products[index].price
                                          .toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RatingBar.builder(
                                  itemSize: 14,
                                  initialRating: double.parse(controller
                                      .products[index].rating!.rate
                                      .toString()),
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 14,
                                  ),
                                  onRatingUpdate: (rating) {
                                    debugPrint(rating.toString());
                                  },
                                ),
                                Text("(" +
                                    controller.products[index].rating!.rate
                                        .toString() +
                                    ")"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
        ),
      ],
    );
  }
}
