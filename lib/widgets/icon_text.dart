import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';
import 'package:flutter_food/widgets/samll_text.dart';

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color color;
  const IconText({ Key? key, 
    required this.icon, 
    required this.text, 
    required this.iconColor,
    this.color = const Color(0xFFccc7c5), 
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: 5.px),
        SmallText(text: text,color:color,)
      ],
    );
  }
}