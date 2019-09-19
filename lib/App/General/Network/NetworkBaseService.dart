/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 14:50:21
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-19 19:32:42
 * @Description: file content
 */

import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/App/General/Utils/ToastHelper.dart';
import './NetworkService.dart';
import './../CustomWidget/Dialog/DialogParam.dart';
import './../CustomWidget/Dialog/LoadingDialog.dart';
import './ResponseData.dart';
import './NetConfig.dart';
import './NetworkTips.dart';

class NetworkBaseService extends NetworkService {
  String url;

  @override
  request(String url,
      {Method method,
      Map<String, dynamic> params,
      var file,
      String fileName,
      String fileSavePath,
      bool showLoad = false,
      String loadMsg = NetworkTips.DEFAULT_LOADING_MESSAGE}) async {
    // TODO: implement request
    this.url = url;

    /// 传参进行统一处理, 加上基本参数
    Map<String, dynamic> basicParam = await getBasicParam();
    basicParam["timeStamp"] =
        (new DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
    if (params != null) {
      basicParam.addAll(params);
    }
    ToastHelper.showLoadingToast();
    ResponseData resultData = await super.request(url,
        method: method,
        params: params,
        file: file,
        fileName: fileName,
        fileSavePath: fileSavePath,
        showLoad: showLoad,
        loadMsg: loadMsg);
    ToastHelper.hidden();

    /// 当apiToken 过期或者错误时的提示码
    if ("101" == resultData.code) {
      // 退出登录并跳转到登录界面
      //App.navigateTo(context, QuRoutes.ROUTE_MINE_LOGIN, clearStack: true);
    }
    return resultData;
  }
  // @override
  // request(String url,
  //     {Method method,
  //     Map<String, dynamic> params,
  //     var file,
  //     String fileName,
  //     String fileSavePath,
  //     bool showLoad = false}) async {
  //   this.url = url;

  //   /// 传参进行统一处理, 加上基本参数
  //   Map<String, dynamic> basicParam = await getBasicParam();
  //   basicParam["timeStamp"] =
  //       (new DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
  //   if (params != null) {
  //     basicParam.addAll(params);
  //   }
  //   ToastHelper.showLoadingToast();
  //   ResponseData resultData = await super.request(url,
  //       method: method,
  //       params: basicParam,
  //       file: file,
  //       fileName: fileName,
  //       fileSavePath: fileSavePath);
  //   ToastHelper.hidden();

  //   /// 当apiToken 过期或者错误时的提示码
  //   if ("101" == resultData.code) {
  //     // 退出登录并跳转到登录界面
  //     //App.navigateTo(context, QuRoutes.ROUTE_MINE_LOGIN, clearStack: true);
  //   }
  //   return resultData;
  // }

  @override
  getBasicUrl() {
    return "http://api.k780.com:88";
    return NetConfig.BASE_URL;
  }

  @override
  getHeaders() async {
    // TODO: implement getHeaders
    Map<String, dynamic> headers;

    /// 可以根据不同的Url 判断是否添加 不同的 headers
    switch (this.url) {
    }
    return headers;
  }

  Future<Map<String, dynamic>> getBasicParam() async {
    Map<String, dynamic> basicParam = {};
    basicParam["agent"] = Platform.isAndroid ? "android" : "ios";
    basicParam["version"] = 1.0;

    /// 可以根据不同的Url 判断是否添加 不同的 参数
    switch (this.url) {
    }
    return basicParam;
  }
}
