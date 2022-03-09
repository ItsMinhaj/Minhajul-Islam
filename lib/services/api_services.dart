import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:minhajul_islam/model/category-model/electronics.dart';
import 'package:minhajul_islam/model/category-model/jewelery.dart';
import 'package:minhajul_islam/model/category-model/men_clothing.dart';
import 'package:minhajul_islam/model/category-model/women_clothing.dart';
import 'package:minhajul_islam/model/products.dart';

class ApiServices {
  // For All products.........
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

// For Electronics Category..........
  static List<Electronics> electronicLists = [];

  static fetchElectronics() async {
    var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/electronics"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        electronicLists.add(Electronics.fromJson(i));
      }
      return electronicLists;
    } else {
      return null;
    }
  }

  // For Jewelery category.......
  static List<Jewelery> jeweleryLists = [];

  static fetchJeweleries() async {
    var response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        jeweleryLists.add(Jewelery.fromJson(i));
      }
      return jeweleryLists;
    } else {
      return null;
    }
  }

  // For Men's clothing.........
  static List<MenClothing> menClothingList = [];

  static fetchMenCloths() async {
    var response = await http.get(
        Uri.parse("https://fakestoreapi.com/products/category/men's clothing"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        menClothingList.add(MenClothing.fromJson(i));
      }
      return menClothingList;
    } else {
      return null;
    }
  }

  // For Women's  clothing..........
  static List<WomenClothing> womenClothingList = [];

  static fetchWomenCloths() async {
    var response = await http.get(Uri.parse(
        "https://fakestoreapi.com/products/category/women's clothing"));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map i in data) {
        womenClothingList.add(WomenClothing.fromJson(i));
      }
      return womenClothingList;
    } else {
      return null;
    }
  }
}
