import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import './SampleList.dart';
import 'package:flutter_app/App/General/Network/NetApiManager.dart';
import 'package:flutter_app/App/General/Network/ResponseData.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/ball_pulse_footer.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';

class TabbarPage extends BasePage {
  TabbarPage({Key key}) : super(key: key);

  TabbarPageView createState() => TabbarPageView();
}

class TabbarPageView extends BasePageView with SingleTickerProviderStateMixin {
  TabController mController;
  List tabList;
  List<Widget> tabWidget;

  // 总数
  int _count = 20;

  Future _onLoad() async {
    await Future.delayed(Duration(seconds: 2), () {
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

  // Future _getbanaData() async {
  //   ResponseData data = await NetApiManager().getWeather();
  //   print("Data-> ${data.toString()}");
  //   setState(() {
  //     _count += 20;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    initTabData();
    mController = TabController(
      length: tabList.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    mController.dispose();
  }

  initTabData() {
    tabList = ['推荐', '热点', '社会', '娱乐', '体育', '美文', '科技', '财经', '时尚'];
    tabWidget = [];
    for (var i = 0; i < tabList.length; i++) {
      String itemText = tabList[i];
      tabWidget.add(Tab(
        text: itemText,
      ));
    }
  }

  Widget getDetailPage() {
    return EasyRefresh.custom(
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
      onLoad: _onLoad,
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
    );
  }

  @override
  Widget renderView() {
    // TODO: implement renderView
    return Column(
      children: <Widget>[
        Container(
          child: TabBar(
            isScrollable: true,
            //是否可以滚动
            controller: mController,
            labelColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: new BubbleTabIndicator(
              indicatorHeight: 25.0,
              indicatorColor: Colors.blueAccent,
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),

            unselectedLabelColor: Color(0xff666666),
            labelStyle: TextStyle(fontSize: 16.0),
            tabs: tabWidget,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: mController,
            children: tabList.map((item) {
              return getDetailPage();
            }).toList(),
          ),
        )
      ],
    );
  }
}
