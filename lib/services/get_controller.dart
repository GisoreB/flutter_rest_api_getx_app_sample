import 'package:flutter_rest_api_getx_app_sample/services/services.dart';
import 'package:get/get.dart';

import '../model/items_model.dart';

class ProductConroller extends GetxController {
  var productItems = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productItems.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}