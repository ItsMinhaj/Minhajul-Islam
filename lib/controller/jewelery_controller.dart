import 'package:get/get.dart';
import 'package:minhajul_islam/model/category-model/jewelery.dart';
import 'package:minhajul_islam/services/api_services.dart';

class JewelerController extends GetxController {
  var products = <Jewelery>[].obs;
  var isLoaded = false.obs;

  Future fetchJeweleryData() async {
    var jewelery = await ApiServices.fetchJeweleries();

    if (jewelery != null) {
      products.value = jewelery;
      isLoaded.value = true;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    fetchJeweleryData();
    super.onInit();
  }
}
