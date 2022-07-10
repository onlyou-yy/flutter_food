import 'package:flutter/material.dart';
import 'package:flutter_food/pages/foodDetail/popular_food_detail.dart';
import 'package:flutter_food/pages/foodDetail/recomented_food_detail.dart';
import 'package:flutter_food/pages/main/main_page.dart';
import 'package:flutter_food/shared/size_fit.dart';
import 'package:flutter_food/helper/depandencies.dart' as dep;

void main() async {
  // WidgetFlutterBinding用于与 Flutter 引擎交互
  // 调用ensureInitialized()确保你有一个 WidgetsBinding 的实例
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  SizeFit.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: PopularFoodDetail(),
      // home: RecomentedFoodDetail(),
    );
  }
}
