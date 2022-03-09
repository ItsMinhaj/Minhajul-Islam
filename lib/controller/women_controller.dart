import 'package:get/get.dart';
import 'package:minhajul_islam/model/category-model/women_clothing.dart';
import 'package:minhajul_islam/services/api_services.dart';

class WomenClothController extends GetxController {
  var products = <WomenClothing>[].obs;
  var isLoaded = false.obs;

  fetchWomenClothData() async {
    var womenCloth = await ApiServices.fetchWomenCloths();

    if (womenCloth != null) {
      products.value = womenCloth;
      isLoaded.value = true;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchWomenClothData();
  }
}
