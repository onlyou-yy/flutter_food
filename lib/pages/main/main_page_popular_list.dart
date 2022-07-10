import 'package:flutter/material.dart';
import 'package:flutter_food/controllers/recommended_product_controller.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/pages/main/main_page_popular_item.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/samll_text.dart';
import 'package:get/get.dart';

class MainPagePopularList extends StatelessWidget {
  const MainPagePopularList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTitle(),
          _buildList(),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(left: 30.px,right: 30.px,bottom: 30.px),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BigText(text: "Recommended",color: AppColors.mainBlackColor,),
          SizedBox(width: 10.px,),
          BigText(text: "·",color: AppColors.textColor,),
          SizedBox(width: 10.px,),
          SmallText(text: "Food pairing"),
        ],
      ),
    );
  }

  Widget _buildList(){
    return GetBuilder<RecommendedProductController>(
      builder: (recdController) {
        return recdController.isLoaded ? ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: recdController.recommendedProductList.length,
          itemBuilder: (ctx,index){
            return MainPagePopularItem(recdController.recommendedProductList[index],index);
          }
        ):
        CircularProgressIndicator(
          color: AppColors.mainColor,
        );
      }
    );
  }
}