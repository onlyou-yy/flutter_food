import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const AppIcon({ 
    Key? key, 
    required this.icon, 
    this.bgColor = const Color(0x7dfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size = 40,
    this.iconSize = 16
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: bgColor
      ),
      child: Icon(icon,color: iconColor,size: iconSize,),
    );
  }
}