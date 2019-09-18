import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter_app/App/General/Common/Global.dart';
import 'package:flutter_app/App/General/Router/routes.dart';
import 'dart:async';

import 'package:flutter_app/App/General/Utils/Application.dart';
import 'package:flutter_app/App/General/Utils/ScreenUtilHelp.dart';

class WelcomePage extends BasePage {
  WelcomePage({Key key}) : super(key: key);
  WelcomePageView createState() => new WelcomePageView();
}

class WelcomePageView extends BasePageView {
  bool isNavigationBarShow = false;
  Timer timer;

  @override
  void initState() {
    print('ABCssDDD');

    // TODO: implement initState
    super.initState();
    //启动页 跳转到
    this.countdown();
  }

  void countdown() {
    timer = new Timer(const Duration(milliseconds: 1500), () {
      try {
        print('登录跳转');
        if (Global.user != null) {
          print("用户信息->${Global.user.toJson()}");
          Application.navigateToRoot(
              context: context, route: "${Routes.mainPage}");
        } else {
          Application.navigateToRoot(
              context: context, route: "${Routes.loginPage}");
        }
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
  }

  @override
  Widget renderView() {
    // TODO: implement renderView
    ScreenUtilHelp.init(context);

    print('设备宽度:${ScreenUtilHelp.screenWidth}'); //Device width
    print('设备高度:${ScreenUtilHelp.screenHeight}'); //Device height
    print('测试缩放高度:${ScreenUtilHelp.scaleHeight(120)}'); //Device width
    print('测试缩放宽度:${ScreenUtilHelp.scaleWidth(200)}'); //Device width

    return Container(
      child: Center(
        child: Image.asset('lib/App/Rescoure/defaultIcon/ic_bg2@3x.png'),
      ),
    );
  }
}
