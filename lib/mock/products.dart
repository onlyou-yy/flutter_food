import 'package:dart_mock/dart_mock.dart' as mock;

class MockProducts{
  static Map<String, dynamic> randomData(int count) {
    Map<String, dynamic> data = {};
    data['totalSize'] = count * 2;
    _createBase(data);
    for (int i = 0; i < count; i++) {
      Map<String, dynamic> item = {};
      _createProduct(item);
      (data['products'] as List).add(item);
    }
    return data;
  }

  static void _createBase(map){
    map['typeId'] = 1;
    map['offset'] = 1;
    map['products'] = [];
  }


  static void _createProduct(map){
    map['id'] = mock.idCard();
    map['name'] = mock.name();
    map['description'] = mock.paragraph();
    map['price'] = mock.doubleR(max: 200,decimal: 1);
    map['location'] = mock.provice();
    map['createAt'] = mock.dateTimeString();
    map['typeId'] = mock.idCard();
    map['updateAt'] = mock.dateTimeString();
    map['stars'] = mock.integer(max: 5);
    map['img'] = mock.image();
  }
}