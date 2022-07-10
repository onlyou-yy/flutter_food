import 'package:flutter_food/data/respository/recommended_product_repo.dart';
import 'package:flutter_food/models/products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList {
    return _recommendedProductList;
  }

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      _recommendedProductList = [];
      ProductsModel data = ProductsModel.fromJson(response.body);
      _recommendedProductList.addAll(data.products!);
      _isLoaded = true;
      update();
    } else {
      print(response.body);
    }
  }
}
