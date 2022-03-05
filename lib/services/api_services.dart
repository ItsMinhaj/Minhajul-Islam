import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minhajul_islam/model/products.dart';

class ApiServices {
  static List<Products> productList = [];
  static fetchProductsData() async {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        productList.add(Products.fromJson(i));
      }
      return productList;
    } else {
      return productList;
    }
  }
}
