import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final double height;
  final int? maxLines;
  final TextOverflow? overflow;
  SmallText({ 
    Key? key, 
    required this.text,
    this.color = const Color(0xFFccc7c5), 
    this.height = 1.2,
    this.size = 12,
    this.maxLines = 1,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontSize: size.px,
        color: color,
        height: height
      ),
    );
  }
}