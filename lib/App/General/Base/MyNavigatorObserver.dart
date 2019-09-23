/*
 * @Author: gongyonghui
 * @Date: 2019-09-23 13:37:06
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-23 13:47:48
 * @Description: 自定义 NavigatorObserver 监听
 */
import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    print("didPush ${route.toString()}");
    if ((previousRoute is TransitionRoute) && previousRoute.opaque) {
      //全屏不透明，通常是一个page
    } else {
      //全屏透明，通常是一个弹窗
    }
  }
}
