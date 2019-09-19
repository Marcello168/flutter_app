import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Common/User.dart';
import 'package:flutter_app/App/General/Utils/SharePreferTool.dart';

// 提供五套可选主题色
const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  static User user;

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;
  // 是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    await SharePreferTool.getInstance(); //等待初始化完成
    // 初始化用户资料
    var mapUser = SharePreferTool.getObject("User");
    print('读取用户信息-> ${mapUser.toString()}');
    if (mapUser != null) {
      try {
        user = User.fromJson(mapUser);
      } catch (e) {
        print('读取用户信息失败-> ${e.toString()}');
      }
    }
    //初始化网络请求相关配置
    // Git.init();
  }

  ///保存用户资料
  static saveUserInfo() {
    SharePreferTool.putObject("User", user);
  }

  ///移出用户资料
  static removeUserInfo() {
    SharePreferTool.putObject("User", null);
    user = null;
  }
}
