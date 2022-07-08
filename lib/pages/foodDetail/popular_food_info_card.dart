import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/icon_text.dart';
import 'package:flutter_food/widgets/samll_text.dart';

class PopularFoodInfoCard extends StatelessWidget {
  const PopularFoodInfoCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 120.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.px),
            topRight: Radius.circular(20.px),
          ),
          color: Colors.white,
        ),
        child: Container(
          padding: EdgeInsets.only(top: 15.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: "Chinese Side"),
              SizedBox(height: 10.px,),
              _buildScoreInfo(),
              SizedBox(height: 20.px,),
              _buildBottomIcon()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconText(icon: Icons.circle_sharp, text: "Normal", iconColor: AppColors.iconColor1),
        IconText(icon: Icons.location_on, text: "32m", iconColor: AppColors.iconColor2),
        IconText(icon: Icons.access_time_rounded, text: "32min", iconColor: AppColors.iconColor2),
      ],
    );
  }

  Widget _buildScoreInfo() {
    return Row(
      children: [
        Wrap(
          children: List.generate(5, (index){
            return Icon(Icons.star,color:AppColors.mainColor,size: 15.px,);
          }),
        ),
        SizedBox(width: 10.px,),
        SmallText(text: "4.5"),
        SizedBox(width: 10.px,),
        SmallText(text: "1287 comments"),
      ],
    );
  }
}