import 'package:flutter_food/data/respository/popular_product_repo.dart';
import 'package:flutter_food/models/products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList {
    return _popularProductList;
  }

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      ProductsModel data = ProductsModel.fromJson(response.body);
      _popularProductList.addAll(data.products!);
      update();
    } else {
      print(response.body);
    }
  }
}
