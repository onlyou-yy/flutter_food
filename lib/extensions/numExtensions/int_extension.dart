import 'package:flutter_food/shared/size_fit.dart';

extension IntFit on int{
  double get rpx {
    return SizeFit.setRpx(this.toDouble());
  }
  double get px {
    return SizeFit.setPx(this.toDouble());
  }

  double get vw {
    return SizeFit.vw(this.toDouble());
  }
  double get vh {
    return SizeFit.vh(this.toDouble());
  }
}