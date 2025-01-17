import 'package:flutter/material.dart';
import 'package:flutter_food/extensions/numExtensions/num_extensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  final double size;
  final TextOverflow overflow;
  BigText({ 
    Key? key, 
    this.color = const Color(0xFF332d2b), 
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 20
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: size.px,
        color: color,
        fontWeight: FontWeight.w400
      ),
    );
  }
}