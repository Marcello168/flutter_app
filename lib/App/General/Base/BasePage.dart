import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  BasePageView createState() => new BasePageView();
}

class BasePageView extends State<BasePage> {
  bool isStatusBarShow = true; //状态栏是否显示
  bool isNavigationBarShow = true; //导航栏是否显示
  bool isBackArrowShow = true; //返回箭头是否显示

  Color topBarColor = Colors.red;
  Color appBarColor = Colors.red;
  Color backArrowColor = Colors.white;
  /**
   * 导航条颜色
   */
  Color appBarContentColor = Colors.blue;

  //标题字体大小
  double appBarCenterTextSize = 18; //根据需求变更
  String appBarTitle = '标题';

  //小标题信息
  String appBarRightTitle;
  double appBarRightTextSize = 15.0;

  Widget renderView() {
    return Container(
      color: Colors.red,
      child: Center(
        child: Text('BaseStatefulPageView'),
      ),
    );
  }

  ///导航栏appBar右边部分 ，不满足可以自行重写
  Widget getAppBarRight() {
    return Text("");
  }

  ///导航栏appBar左边部分 ，不满足可以自行重写
  Widget getAppBarLeft() {
    return InkWell(
      onTap: didClickAppBarBack,
      child: Icon(
        Icons.arrow_back_ios,
        color: backArrowColor,
      ),
    );
  }

  void didClickAppBarBack() {
    print('后退返回');
  }

  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: isNavigationBarShow
          ? new AppBar(
              centerTitle: true,
              title: Text(appBarTitle),
              leading: isBackArrowShow ? getAppBarLeft() : null,
              backgroundColor: appBarContentColor,
            )
          : null,
      body: renderView(),
    );
  }
}
