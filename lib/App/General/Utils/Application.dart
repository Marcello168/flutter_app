/*
 * @Author: gongyonghui
 * @Date: 2019-09-08 13:51:36
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-18 10:53:43
 * @Description: file content
 */

/**
 * 全局应用
 * Create by Songlcy
 */
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

class Application {
  static Router router;
  static navigateTo(
      {@required BuildContext context,
      @required String route,
      transition = TransitionType.cupertino}) {
    router.navigateTo(context, route, transition: transition);
  }

  ///导航到根页面
  static navigateToRoot(
      {@required BuildContext context,
      @required String route,
      transition = TransitionType.fadeIn}) {
    router.navigateTo(context, route, transition: transition, replace: true);
  }
}
