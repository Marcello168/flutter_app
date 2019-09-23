/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 08:59:25
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-20 14:57:03
 * @Description: file content
 */

import './NetworkBaseService.dart';
import './ResponseData.dart';

// export const NetApi = NetApiManager.getInstance();

/// API 管理
class NetApiManager extends NetworkBaseService {
  // 工厂模式
  factory NetApiManager() => _getInstance();
  static NetApiManager get instance => _getInstance();
  static NetApiManager _instance;
  NetApiManager._internal() {
    // 初始化
  }
  static NetApiManager _getInstance() {
    if (_instance == null) {
      _instance = new NetApiManager._internal();
    }
    return _instance;
  }

  /// 获取天气的接口
  static const String _GET_WEATHER = "/";
  Future<ResponseData> getWeather() async {
    Map<String, dynamic> param = {};

    ///?app=weather.future&weaid=1&&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json
    param["app"] = "weather.future";
    param["weaid"] = "1";
    param["appkey"] = "10003";
    param["sign"] = "b59bc3ef6191eb9f747dd4e83c99f2a4";
    param["format"] = "json";
    ResponseData resultData = await get(_GET_WEATHER, params: param);
    resultData.toast();
    return resultData;
  }
}
