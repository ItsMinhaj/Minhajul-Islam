import 'package:get/get.dart';
import 'package:minhajul_islam/model/category-model/men_clothing.dart';
import 'package:minhajul_islam/services/api_services.dart';

class MenClothController extends GetxController {
  var products = <MenClothing>[].obs;
  var isLoaded = false.obs;

  fetchMenClothsData() async {
    var menCloths = await ApiServices.fetchMenCloths();

    if (menCloths != null) {
      products.value = menCloths;
      isLoaded.value = true;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchMenClothsData();
  }
}
