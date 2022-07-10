import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_food/config/app_constants.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/models/products_model.dart';
import 'package:flutter_food/pages/foodDetail/recomented_food_detail.dart';
import 'package:flutter_food/routes/route_helper.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/icon_text.dart';
import 'package:flutter_food/widgets/samll_text.dart';
import 'package:get/get.dart';

class MainPagePopularItem extends StatelessWidget {
  Products data;
  int index;
  MainPagePopularItem(this.data, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteHelper.getRecommendedFood(index));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildBg(),
            _buildInfo(),
          ],
        ),
      ),
    );
  }

  Widget _buildBg() {
    return Container(
      width: 120.px,
      height: 120.px,
      decoration: BoxDecoration(
        color: Colors.white38,
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("${AppConstants.IMG_BASE_URL}${data.img!}")),
        borderRadius: BorderRadius.circular(15.px),
      ),
    );
  }

  Widget _buildInfo() {
    return Expanded(
      child: Container(
        height: 100.px,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.px),
            bottomRight: Radius.circular(15.px),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: data.name!),
              SmallText(text: data.description!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconText(
                      icon: Icons.circle_sharp,
                      text: "Normal",
                      iconColor: AppColors.iconColor1),
                  IconText(
                      icon: Icons.location_on,
                      text: "32m",
                      iconColor: AppColors.iconColor2),
                  IconText(
                      icon: Icons.access_time_rounded,
                      text: "32min",
                      iconColor: AppColors.iconColor2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
