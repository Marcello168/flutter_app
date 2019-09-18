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
    SharePreferTool tool = await SharePreferTool.getInstance();

    var mapUser = SharePreferTool.getObject("User");
    print('读取用户信息-> ${mapUser}');

    if (mapUser != null) {
      try {
        user = User.fromJson(mapUser);
      } catch (e) {
        print('读取用户信息失败-> ${e}');
      }
    }
    // 初始化用户资料

    //初始化网络请求相关配置
    // Git.init();
  }

  ///保存用户资料
  static saveUserInfo() {
    SharePreferTool.putObject("User", user);
  }

  ///移出用户资料
  static removeUserInfo() {
    user = null;
    SharePreferTool.putObject("User", null);
  }
}
