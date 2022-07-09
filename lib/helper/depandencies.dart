import 'package:flutter_food/controllers/popular_product_controller.dart';
import 'package:flutter_food/data/api/api_client.dart';
import 'package:flutter_food/data/respository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
}
