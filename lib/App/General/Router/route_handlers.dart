/*
 * @Author: gongyonghui
 * @Date: 2019-09-08 13:59:21
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-18 11:15:59
 * @Description: 路由定义
 */

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/Pages/LoginPage/LoginPage.dart';
import 'package:flutter_app/App/Pages/MainPage/MainPage.dart';
import 'package:flutter_app/App/Pages/TestPage/RefreshPage.dart';
import 'package:flutter_app/App/Pages/TestPage/TabbarPage.dart';

// var rootHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return HomeComponent();
// });

var loginRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

/// 刷新页面
var refreshPageRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RefreshPage();
});

/// 刷新页面
var tabbarPageRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabbarPage();
});

var mainRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return APPMainPage();
});
