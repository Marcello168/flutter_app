import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter_app/App/General/Network/NetApiManager.dart';
import 'package:flutter_app/App/General/Network/ResponseData.dart';
import 'package:flutter_app/App/General/Router/routes.dart';
import 'package:flutter_app/App/General/Utils/Application.dart';
import 'package:flutter_app/App/General/Utils/ScreenUtilHelp.dart';
import 'package:flutter_app/App/General/Utils/ToastHelper.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:oktoast/oktoast.dart';
import 'dart:async';

class HomeMainPage extends BasePage {
  HomeMainPage({Key key}) : super(key: key);

  HomeMainView createState() => HomeMainView();
}

class HomeMainView extends BasePageView {
  bool isBackArrowShow = false; //返回箭头是否显示
  String appBarTitle = '首页';
  List _babaData = [];
  _didClickLoginButton() {
    print('登录');
  }

  void _showToast() {
    showToast("msg");
  }

  void _showCustomWidgetToast() {
    ToastHelper.showLoadingToast();
    new Timer(const Duration(milliseconds: 1500), () {
      print('111111111111111');
      ToastHelper.hidden();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getbanaData();
  }

  _getbanaData() async {
    ResponseData data = await NetApiManager().getWeather();
    print("Data-> ${data.toString()}");
  }

  _didClickRefreshPage() {
    Application.navigateToRoot(
        context: context, route: "${Routes.refreshPage}");
  }

  @override
  Widget renderView() {
    // TODO: implement renderView
    return Container(
      color: Colors.orange,
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: ScreenUtilHelp.screenWidth,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                var data = _babaData[index];
                String imgUri = data['cover'];
                return new Image.network(
                  imgUri,
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: _babaData.length,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          ),
          RaisedButton(
            child: Text('上下拉刷新1'),
            onPressed: _didClickRefreshPage,
          ),
          RaisedButton(
            child: Text('自定义Widget Toast'),
            onPressed: _showCustomWidgetToast,
          ),
          RaisedButton(
            child: Text('ToastHelper '),
            onPressed: _getbanaData,
          )
        ],
      ),
    );
  }
}
