import 'package:flutter/material.dart';
import './MyNavigatorObserver.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);

  BasePageView createState() => new BasePageView();
}

class BasePageView extends State<BasePage> {
  MyNavigatorObserver myObserver = MyNavigatorObserver();

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

  @override
  void initState() {
    super.initState();
    //建议在initState时动态添加Observer，而不是build时，避免重复添加
    // Navigator.of(context).widget.observers.add(myObserver);
  }

  @override
  void dispose() {
    super.dispose();
    //dispose时记得移除监听
    // Navigator.of(context).widget.observers.remove(myObserver);
  }

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
    Navigator.pop(context);
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
