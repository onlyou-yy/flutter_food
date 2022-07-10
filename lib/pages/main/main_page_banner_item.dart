import 'package:flutter/material.dart';
import 'package:flutter_food/config/app_constants.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/mock/mock_image.dart';
import 'package:flutter_food/models/products_model.dart';
import 'package:flutter_food/shared/app_colors.dart';
import 'package:flutter_food/widgets/big_text.dart';
import 'package:flutter_food/widgets/icon_text.dart';
import 'package:flutter_food/widgets/samll_text.dart';

class MainPageBannerItem extends StatefulWidget {
  int index = 0;
  double currPageValue = 0;
  late Products data;
  MainPageBannerItem({
    this.index = 0, 
    this.currPageValue = 0, 
    Key? key,
    required this.data
  })
      : super(key: key);

  @override
  State<MainPageBannerItem> createState() => _MainPageBannerItemState();
}

class _MainPageBannerItemState extends State<MainPageBannerItem>
    with AutomaticKeepAliveClientMixin {
  double _scaleFactor = 0.8;
  double _height = 220.px;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    Matrix4 matrix = this.getTransMatrix4();
    return Transform(
      transform: matrix,
      child: Stack(
        children: [_buildBannerBg(), _buildBannerInfo()],
      ),
    );
  }

  Matrix4 getTransMatrix4() {
    var currScale = 1.0;
    Matrix4 matrix = Matrix4.identity();
    if (widget.index == widget.currPageValue.floor()) {
      currScale =
          1 - (widget.currPageValue - widget.index) * (1 - _scaleFactor);
    } else if (widget.index == widget.currPageValue.floor() + 1) {
      currScale = _scaleFactor +
          (widget.currPageValue - widget.index + 1) * (1 - _scaleFactor);
    } else if (widget.index == widget.currPageValue.floor() - 1) {
      currScale =
          1 - (widget.currPageValue - widget.index) * (1 - _scaleFactor);
    } else {
      currScale = _scaleFactor;
    }
    var currTrans = _height * (1 - currScale) / 2;
    matrix = Matrix4.diagonal3Values(1, currScale, 1)
      ..setTranslationRaw(1, currTrans, 1);
    return matrix;
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildBannerInfo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 120.px,
        margin: EdgeInsets.only(left: 30.px, right: 30.px, bottom: 15.px),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.px),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0xFFe8e8e8),
                blurRadius: 5.0,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(-5, 0),
              ),
            ]),
        child: Container(
          padding: EdgeInsets.only(top: 15.px, left: 15.px, right: 15.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigText(text: widget.data.name!),
              SizedBox(
                height: 10.px,
              ),
              _buildScoreInfo(),
              SizedBox(
                height: 20.px,
              ),
              _buildBottomIcon()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomIcon() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }

  Widget _buildScoreInfo() {
    return Row(
      children: [
        Wrap(
          children: List.generate(5, (index) {
            return Icon(
              Icons.star,
              color: AppColors.mainColor,
              size: 15.px,
            );
          }),
        ),
        SizedBox(
          width: 10.px,
        ),
        SmallText(text: widget.data.stars!.toString()),
        SizedBox(
          width: 10.px,
        ),
        SmallText(text: "1287 comments"),
      ],
    );
  }

  Widget _buildBannerBg() {
    return Container(
      height: _height,
      margin: EdgeInsets.symmetric(horizontal: 10.px),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.px),
          color: Colors.blue,
          image: DecorationImage(
              image: NetworkImage("${AppConstants.IMG_BASE_URL}${widget.data.img!}"),
              fit: BoxFit.cover)),
    );
  }
}
