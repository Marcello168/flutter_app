/*
 * @Author: gongyonghui
 * @Date: 2019-09-20 09:17:23
 * @LastEditors: gongyonghui
 * @LastEditTime: 2019-09-23 15:15:56
 * @Description: RefreshPage 刷新页面 刷新状态
 */

import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Network/NetApiManager.dart';
import 'package:flutter_app/App/General/Network/ResponseData.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import './SampleList.dart';

class RefreshPage extends BasePage {
  RefreshPage({Key key}) : super(key: key);

  RefreshPageView createState() => RefreshPageView();
}

class RefreshPageView extends BasePageView {
  // 总数
  int _count = 20;

  Future _onLoad() async {
    await Future.delayed(Duration(seconds: 10), () {
      print('测试时间');
      setState(() {
        _count += 20;
      });
    });
  }

  Future _onRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _count = 20;
      });
    });
  }

  Future _getbanaData() async {
    ResponseData data = await NetApiManager().getWeather();
    print("Data-> ${data.toString()}");
    setState(() {
      _count += 20;
    });
  }

  @override
  void didClickAppBarBack() {
    print('后退返回');
    Navigator.pop(context);
  }

  @override
  Widget renderView() {
    return Container(
      child: EasyRefresh.custom(
        header: BallPulseHeader(),
        footer: BallPulseFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 10), () {
            print('测试时间');

            setState(() {
              _count = 20;
            });
          });
        },
        onLoad: _getbanaData,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return SampleListItem();
              },
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }
}
