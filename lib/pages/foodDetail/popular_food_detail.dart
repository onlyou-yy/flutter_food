import 'package:flutter/material.dart';
import 'package:flutter_food/controllers/popular_product_controller.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/mock/faker.dart';
import 'package:flutter_food/mock/mock_image.dart';
import 'package:flutter_food/models/products_model.dart';
import 'package:flutter_food/pages/foodDetail/popular_food_info_card.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/app_icon.dart';
import 'package:flutter_food/shared/size_fit.dart';
import 'package:flutter_food/widgets/big_bottom_bar.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  late Products product;
  PopularFoodDetail({Key? key, required this.pageId}) : super(key: key){
    product = Get.find<PopularProductController>().popularProductList[pageId];
  }
  final bgHeight = 350;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildBg(),
          _buildTopBtn(),
          _buildMsg(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    return BigBottomBar(items: [
      Container(
        padding: EdgeInsets.all(20.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.px),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(
              Icons.remove,
              color: AppColors.signColor,
            ),
            SizedBox(
              width: 10.px,
            ),
            BigText(text: "0"),
            SizedBox(
              width: 10.px,
            ),
            Icon(
              Icons.add,
              color: AppColors.signColor,
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(20.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.px),
          color: AppColors.mainColor,
        ),
        child: BigText(
          text: "\$10 | Add to cart",
          color: Colors.white,
        ),
      ),
    ]);
  }

  Positioned _buildMsg() {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: bgHeight.px - 30.px,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.px),
                topRight: Radius.circular(20.px),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopularFoodInfoCard(),
              SizedBox(
                height: 20.px,
              ),
              BigText(
                text: product.name!,
                size: 18.px,
              ),
              SizedBox(
                height: 20.px,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                          text: product.description!)))
            ],
          ),
        ));
  }

  Positioned _buildTopBtn() {
    return Positioned(
        left: 20.px,
        right: 20.px,
        top: SizeFit.safeAreaTop.px,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconSize: 16.px,
                )),
            AppIcon(
              icon: Icons.shopping_cart_outlined,
              iconSize: 16.px,
            ),
          ],
        ));
  }

  Positioned _buildBg() {
    return Positioned(
        left: 0.px,
        right: 0.px,
        child: Container(
          width: double.maxFinite,
          height: bgHeight.px,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(product.img!),
          )),
        ));
  }
}
