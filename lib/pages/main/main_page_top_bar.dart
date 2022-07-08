import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/samll_text.dart';

class MainPageTopBar extends StatelessWidget {
  const MainPageTopBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTopLeft(),
          _buildTopRight(),
        ],
      ),
    );
  }

  Widget _buildTopLeft(){
    return Column(
      children: [
        BigText(text: "Bangladesh",color: AppColors.mainColor,),
        Row(
          children: [
            SmallText(text: "Narsinqdi",color: Colors.black54,),
            Icon(Icons.arrow_drop_down_rounded),
          ]
        ),
      ],
    );
  }

  Widget _buildTopRight(){
    return Container(
      width: 45.px,
      height: 45.px,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(15.px),
      ),
      child: Icon(Icons.search,color: Colors.white,),
    );
  }
}