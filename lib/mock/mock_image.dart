import 'dart:math';

class MockImage{
  static String _baseUrl = "https://picsum.photos";
  static String randomImg([int width = 400,int height = 400]){
    return '$_baseUrl/$width/$height?random=${Random().nextInt(400)}';
  }
  static String img([int width = 400,int height = 400]){
    return '$_baseUrl/$width/$height';
  }
  static String imgId([int id = 1,int width = 400,int height = 400]){
    return '$_baseUrl/id/$id/$width/$height';
  }
  static String seedImg([String seed = "LNRyGwIJr5c",int width = 400,int height = 400]){
    return '$_baseUrl/seed/$seed/$width/$height';
  }
}