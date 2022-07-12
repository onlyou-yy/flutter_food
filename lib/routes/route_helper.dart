import 'package:flutter_food/pages/foodDetail/popular_food_detail.dart';
import 'package:flutter_food/pages/foodDetail/recomented_food_detail.dart';
import 'package:flutter_food/pages/main/main_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => "$initial";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId) => "$recommendedFood?pageId=$pageId";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainPage()),
    GetPage(
        name: popularFood,
        page: () {
          int pageId = int.parse(Get.parameters['pageId']!);
          return PopularFoodDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          int pageId = int.parse(Get.parameters['pageId']!);
          return RecomentedFoodDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
  ];
}
