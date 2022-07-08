import 'package:flutter_food/shared/size_fit.dart';

extension DoubleFit on double{
  double get rpx {
    return SizeFit.setRpx(this);
  }
  double get px {
    return SizeFit.setPx(this);
  }

  double get vw {
    return SizeFit.vw(this);
  }
  double get vh {
    return SizeFit.vh(this);
  }
}