import 'package:faker_dart/faker_dart.dart';
class FakerData{
  static Faker? _faker;
  static Faker get ins{
    if(_faker == null){
      _faker = Faker.instance;
    }
    return _faker!;
  }
}