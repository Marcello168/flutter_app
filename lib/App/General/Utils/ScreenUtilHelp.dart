import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtilHelp {
  static double _screenWidth;
  static double _screenHeight;

  static init(context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // this.screenWidth = ;
    _screenWidth = ScreenUtil.screenWidth;
    _screenHeight = ScreenUtil.screenHeight;
  }

  static get screenWidth {
    return _screenWidth;
  }

  static get screenHeight {
    return _screenHeight;
  }

  /// 缩放宽度
  static scaleWidth(double width) {
    return ScreenUtil.getInstance().setWidth(width);
  }

  /// 缩放高度
  static scaleHeight(double height) {
    return ScreenUtil.getInstance().setHeight(height);
  }

  /// 缩放字体
  static scaleFont(double font) {
    return ScreenUtil.getInstance().setSp(font);
  }

  /// 允许跟随系统缩放字体
  static allowFontScaling(double font) {
    ScreenUtil(allowFontScaling: true).setSp(font);
  }
}
