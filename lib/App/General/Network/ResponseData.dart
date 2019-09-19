/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 14:07:40
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-19 14:49:41
 * @Description: file content
 */
import './NetConfig.dart';
import 'package:flutter/material.dart';

class ResponseData {
  Map<String, dynamic> response; // 所有返回值
  dynamic data; // 请求回来的data, 可能是list也可能是map
  String code; // 服务器的状态码
  String msg; // 服务器给的提示信息
  /// true 请求成功 false 请求失败
  bool result = true; // 客户端是否请求成功false: HTTP错误
  String url = "";

  ResponseData(this.msg, this.result, {this.url = ""});

  ResponseData.response(this.response, {this.url = ""}) {
    this.code = this.response["success"];
    this.msg = this.response["msg"];
    this.data = this.response["data"];
  }

  bool isFail() {
    bool success = result && code == "1";
    if (!success) {
      mDebugPrint("Not success for $url:$result,code:$code,msg:$msg");
    }
    return !success;
  }

  bool isSuccess() {
    bool success = result && code == "1";
    if (!success) {
      mDebugPrint("Not success for $url:$result,code:$code,msg:$msg");
    }
    return success;
  }

  /// 失败情况下弹提示
  bool toast() {
    if (isFail()) {
      // Fluttertoast.showToast(msg: msg);
      return true;
    } else {
      return false;
    }
  }

  mDebugPrint(String log) {
    if (NetConfig.DEBUG) {
      debugPrint(log);
    }
  }
}
