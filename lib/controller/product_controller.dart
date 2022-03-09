import 'package:get/get.dart';
import 'package:minhajul_islam/model/products.dart';
import 'package:minhajul_islam/services/api_services.dart';

class ProductController extends GetxController {
  var dataList = <Products>[].obs;
  var isLoaded = false.obs;

  loadData() async {
    var allData = await ApiServices.fetchProductsData();

    if (allData != null) {
      dataList.value = allData;
      isLoaded.value = true;
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadData();
  }
}
