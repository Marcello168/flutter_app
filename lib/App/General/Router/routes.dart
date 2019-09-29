/*
 * @Author: gongyonghui
 * @Date: 2019-09-08 13:58:32
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-20 09:37:14
 * @Description: file content
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String loginPage = "/loginPage";
  static String mainPage = "/mainPage";
  static String refreshPage = "/refreshPage";
  static String tabbarPage = "/tabbarPage";

  static void configureRoutes(Router router) {
    router.define(loginPage, handler: loginRouteHandler);
    router.define(mainPage, handler: mainRouteHandler);
    router.define(refreshPage, handler: refreshPageRouteHandler);
    router.define(tabbarPage, handler: tabbarPageRouteHandler);

    // router.define(root, handler: rootHandler);

    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
  }
}
