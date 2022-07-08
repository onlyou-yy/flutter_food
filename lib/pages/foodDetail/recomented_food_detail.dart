import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/mock/faker.dart';
import 'package:flutter_food/mock/mock_image.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/app_icon.dart';
import 'package:flutter_food/widgets/big_bottom_bar.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/expandable_text_widget.dart';

class RecomentedFoodDetail extends StatelessWidget {
  const RecomentedFoodDetail({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          _buildContent()
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Column _buildBottomBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.px,vertical: 10.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.remove,iconSize: 24.px,iconColor: Colors.white,bgColor: AppColors.mainColor,),
              BigText(text: "\$12.88 x 0"),
              AppIcon(icon: Icons.add,iconSize: 24.px,iconColor: Colors.white,bgColor: AppColors.mainColor),
            ],
          ),
        ),
        BigBottomBar(
          items: [
            Container(
              padding: EdgeInsets.all(20.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.px),
                color:Colors.white,
              ),
              child: Icon(
                Icons.favorite,
                color: AppColors.mainColor,
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.px),
                color:AppColors.mainColor,
              ),
              child: BigText(text:"\$10 | Add to cart",color: Colors.white,),
            ),
          ]
      ),
      ],
    );
  }

  SliverToBoxAdapter _buildContent() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.px),
            child: ExpandableTextWidget(
              text:FakerData.ins.lorem.paragraph(sentenceCount: 80),
            ),  
          ),
        ],
      ),
        
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      toolbarHeight: 80.px,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(icon: Icons.clear,bgColor: Colors.white,),
            AppIcon(icon: Icons.shopping_cart_outlined,bgColor: Colors.white),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.px),
        child: Container(
          padding: EdgeInsets.only(top: 5.px,bottom: 10.px),
          child: Center(child:BigText(size: 26.px, text: "Chinese Size",),),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.px),
              topRight: Radius.circular(10.px),
            )
          ),
        )
      ),
      expandedHeight: 300.px,
      pinned: true,
      backgroundColor: AppColors.yellowColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          MockImage.imgId(3),
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}