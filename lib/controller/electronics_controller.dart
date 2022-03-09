import 'package:get/get.dart';
import 'package:minhajul_islam/model/category-model/electronics.dart';
import 'package:minhajul_islam/services/api_services.dart';

class ElectronicsController extends GetxController {
  var products = <Electronics>[].obs;
  var isLoaded = false.obs;

  fetchElectronicsData() async {
    var electronics = await ApiServices.fetchElectronics();

    if (electronics != null) {
      products.value = electronics;
      isLoaded.value = true;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    fetchElectronicsData();
    super.onInit();
  }
}
