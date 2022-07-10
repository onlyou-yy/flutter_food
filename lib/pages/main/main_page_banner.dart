import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/controllers/popular_product_controller.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/pages/foodDetail/popular_food_detail.dart';
import 'package:flutter_food/pages/main/main_page_banner_item.dart';
import 'package:flutter_food/routes/route_helper.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:get/get.dart';

class MainPageBanner extends StatefulWidget {
  const MainPageBanner({Key? key}) : super(key: key);

  @override
  State<MainPageBanner> createState() => _MainPageBannerState();
}

class _MainPageBannerState extends State<MainPageBanner> {
  double _currentPageValue = 1;
  PageController _pageController =
      PageController(viewportFraction: 0.85, initialPage: 1);
  int _pageLen = 5;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //轮播图
        GetBuilder<PopularProductController>(builder: (popController) {
          int pageLen = popController.popularProductList.length <= 0
              ? 1
              : popController.popularProductList.length;
          return popController.isLoaded
              ? Container(
                  padding: EdgeInsets.only(top: 10.px),
                  // color:Colors.red,
                  height: 320.px,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: pageLen,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(RouteHelper.getPopularFood(index));
                          },
                          child: MainPageBannerItem(
                            index: index,
                            currPageValue: _currentPageValue,
                            data: popController.popularProductList[index],
                          ),
                        );
                      }),
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        //轮播控制点
        GetBuilder<PopularProductController>(builder: (popController) {
          int pageLen = popController.popularProductList.length <= 0
              ? 1
              : popController.popularProductList.length;
          return popController.isLoaded ? DotsIndicator(
            dotsCount: pageLen,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ):
          CircularProgressIndicator(
            strokeWidth: 2.0,
            color: AppColors.mainColor,
          );
        })
      ],
    );
  }
}
