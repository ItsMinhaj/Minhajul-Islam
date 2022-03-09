import 'package:get/get.dart';
import 'package:minhajul_islam/model/category-model/men_clothing.dart';
import 'package:minhajul_islam/services/api_services.dart';

class MenClothController extends GetxController {
  var products = <MenClothing>[].obs;

  fetchMenClothsData() async {
    var menCloths = await ApiServices.fetchMenCloths();

    if (menCloths != null) {
      products.value = menCloths;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchMenClothsData();
  }
}
