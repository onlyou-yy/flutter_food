import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/shared/app_colors.dart';

class BigBottomBar extends StatelessWidget {
  final List<Widget> items;
  const BigBottomBar({
    Key? key,
    required this.items
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.px,
      padding: EdgeInsets.symmetric(horizontal: 20.px,vertical: 30.px),
      decoration: BoxDecoration(
        color: AppColors.buttonBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.px),
          topRight: Radius.circular(30.px),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items,
      ),
    );
  }
}