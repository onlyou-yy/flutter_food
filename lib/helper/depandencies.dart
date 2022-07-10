import 'package:flutter_food/config/app_constants.dart';
import 'package:flutter_food/controllers/popular_product_controller.dart';
import 'package:flutter_food/controllers/recommended_product_controller.dart';
import 'package:flutter_food/data/api/api_client.dart';
import 'package:flutter_food/data/respository/popular_product_repo.dart';
import 'package:flutter_food/data/respository/recommended_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find<PopularProductRepo>()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find<ApiClient>()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find<RecommendedProductRepo>()));
}
