/*
 * @Author: gongyonghui
 * @Date: 2019-09-19 20:11:29
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-20 09:06:01
 * @Description: file content
 */

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';

/// 定义回调类型
typedef Future<void> OnRefresh();

typedef Future<void> LoadMore();

class RefreshListView extends StatefulWidget {
  final List listData;
  final Widget child;
  final OnRefresh onRefresh;
  final LoadMore loadMore;

  RefreshListView(
      {Key key,
      @required this.child,
      @required this.listData,
      this.onRefresh,
      this.loadMore})
      : super(key: key);

  RefreshListViewState createState() => RefreshListViewState();
}

class RefreshListViewState extends State<RefreshListView> {
  @override
  Widget build(BuildContext context) {
    return getListViewContainer();
  }

  void initState() {
    super.initState();
  }

  ///
  getListViewContainer() {
    return Container();
  }
}
