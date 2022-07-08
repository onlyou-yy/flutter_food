import 'package:flutter_food/mock/faker.dart';

void main(List<String> args) {
  print(FakerData.ins.image.loremPicsum.image());
  print(FakerData.ins.lorem.paragraph(sentenceCount: 50));
}