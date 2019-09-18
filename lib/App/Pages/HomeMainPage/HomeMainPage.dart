import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeMainPage extends BasePage {
  HomeMainPage({Key key}) : super(key: key);

  HomeMainView createState() => HomeMainView();
}

class HomeMainView extends BasePageView {
  bool isBackArrowShow = false; //返回箭头是否显示
  String appBarTitle = '首页';

  _didClickLoginButton() {
    print('登录');
  }

  @override
  Widget renderView() {
    // TODO: implement renderView
    return Container(
      color: Colors.orange,
      child: Row(
        children: <Widget>[
          Container(
            height: 200,
            width: 350,
            child: new Swiper(
              itemBuilder: (BuildContext context, int index) {
                return new Image.network(
                  "http://via.placeholder.com/350x150",
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              itemCount: 3,
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
              viewportFraction: 0.8,
              scale: 0.9,
            ),
          )
        ],
      ),
    );
  }
}
