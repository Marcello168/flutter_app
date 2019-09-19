import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter_app/App/General/CustomWidget/EmptyPage/EmptyPage.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class DiscoverMainPage extends BasePage {
  DiscoverMainPage({Key key}) : super(key: key);

  DiscoverMainView createState() => DiscoverMainView();
}

class DiscoverMainView extends BasePageView {
  bool isBackArrowShow = false; //返回箭头是否显示
  String appBarTitle = '发现';

  EasyRefreshController _controller;
  ScrollController _scrollController;

  // 条目总数
  int _count = 0;

  // 无限加载
  bool _enableInfiniteLoad = true;
  // 控制结束
  bool _enableControlFinish = false;

  // 是否开启刷新
  bool _enableRefresh = true;
  // 是否开启加载
  bool _enableLoad = true;
  // 顶部回弹
  bool _topBouncing = true;
  // 底部回弹
  bool _bottomBouncing = true;

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
    _scrollController = ScrollController();
  }

  _didClickLoginButton() {
    print('登录');
  }

  @override
  Widget renderView() {
    // TODO: implement renderView
    return Container(
      color: Colors.orange,
      child: Center(
        child: EasyRefresh.custom(
          emptyWidget: _count == 0 ? EmptyPage() : null,
          enableControlFinishRefresh: true,
          enableControlFinishLoad: true,
          controller: _controller,
          scrollController: _scrollController,
          topBouncing: _topBouncing,
          bottomBouncing: _bottomBouncing,
          onRefresh: _enableRefresh
              ? () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _count = 20;
                    });
                    if (!_enableControlFinish) {
                      _controller.resetLoadState();
                      _controller.finishRefresh();
                    }
                  });
                }
              : null,
          onLoad: _enableLoad
              ? () async {
                  await Future.delayed(Duration(seconds: 2), () {
                    setState(() {
                      _count += 20;
                    });
                    if (!_enableControlFinish) {
                      _controller.finishLoad(noMore: _count >= 80);
                    }
                  });
                }
              : null,
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 100,
                    width: 350,
                    color: Colors.red,
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 350,
                      height: 1,
                      color: Colors.green,
                    ),
                  );
                },
                childCount: _count,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
