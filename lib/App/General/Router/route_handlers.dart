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

// var rootHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   return HomeComponent();
// });

var loginRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var mainRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return APPMainPage();
});
