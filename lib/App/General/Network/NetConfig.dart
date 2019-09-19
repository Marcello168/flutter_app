/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 13:34:19
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-19 14:20:35
 * @Description: file content
 */

/// 网络配置
class NetConfig {
  ///  是否开启 调试模式
  static const DEBUG = true;

  /// 正式域名
  static const String REALEASE_BASE_URL = 'www.baidu.com';

  /// 测试域名
  static const String TEST_BASE_URL = 'www.baidu.com';

  /// 域名 Base uri
  ///
  static const String BASE_URL = DEBUG ? TEST_BASE_URL : REALEASE_BASE_URL;

  /// 连接超时
  static const int CONNECT_TIMEOUT = 10 * 1000;

  /// 接收超时
  static const int RECEIVE_TIMEOUT = 3 * 1000;

  /// 通用请求头
  static const BASE_HEADER = {};

  /// 通用参数
  static const BASE_PARAMS = {};
}
