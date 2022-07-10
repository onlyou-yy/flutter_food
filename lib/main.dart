import 'package:flutter/material.dart';
import 'package:flutter_food/routes/route_helper.dart';
import 'package:flutter_food/shared/size_fit.dart';
import 'package:flutter_food/helper/depandencies.dart' as dep;
import 'package:get/get.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.getInitial(),
      getPages: RouteHelper.routes,
    );
  }
}
