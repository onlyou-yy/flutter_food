import 'dart:ui';

import 'package:flutter/material.dart';
class SizeFit{
  static late double physicalWidth;
  static late double physicalHeight;
  static late double dpr;
  static late double screenWidth;
  static late double screenHeight;
  
  static late double rpx;
  static late double px;
  
  static late double rem;
  
  static void initialize({double standardSize = 750,double standardRem = 16}){
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;
    dpr = window.devicePixelRatio;
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
    
    rem = standardRem;
  }
  
  static double setRpx(double size){
    return rpx * size;
  }
  static double setPx(double size){
    return px * size;
  }
  
  static double vw(double percent){
    return percent / 100 * screenWidth;
  }
  static double vh(double percent){
    return percent / 100 * screenHeight;
  }
  
  static double setRem(double size){
    return size * rem;
  }

  static double get safeAreaTop{
    return MediaQueryData.fromWindow(window).padding.top;
  }

  static double get safeAreaBottom{
    return MediaQueryData.fromWindow(window).padding.bottom;
  }

  static double get safeAreaLeft{
    return MediaQueryData.fromWindow(window).padding.left;
  }

  static double get safeAreaRight{
    return MediaQueryData.fromWindow(window).padding.right;
  }
}