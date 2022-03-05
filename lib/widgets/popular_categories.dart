import 'package:flutter/material.dart';
import 'package:minhajul_islam/services/api_services.dart';

class BuildPopularCategories extends StatelessWidget {
  const BuildPopularCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: ApiServices.fetchProductsData(),
                builder: (context, AsyncSnapshot snapshot) {
                  var data = ApiServices.productList;
                  if (!snapshot.hasData) {
                    const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1, mainAxisExtent: 200),
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(
                                  data[index].image.toString(),
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }));
                }),
          ),
        ],
      ),
    );
  }
}
