import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter_app/App/General/Common/Global.dart';
import 'package:flutter_app/App/General/Router/routes.dart';
import 'package:flutter_app/App/General/Utils/Application.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MyMainPage extends BasePage {
  MyMainPage({Key key}) : super(key: key);

  MyMainPageView createState() => MyMainPageView();
}

class MyMainPageView extends BasePageView {
  bool isBackArrowShow = false; //返回箭头是否显示
  String appBarTitle = '个人中心';

  @override
  Widget renderView() {
    // TODO: implement renderView
    return Container(
      color: Colors.orange,
      child: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          EasyRefresh.custom(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  // 顶部栏
                  new Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 220.0,
                        color: Colors.white,
                      ),
                      ClipPath(
                        clipper: new TopBarClipper(
                            MediaQuery.of(context).size.width, 200.0),
                        child: new SizedBox(
                          width: double.infinity,
                          height: 200.0,
                          child: new Container(
                            width: double.infinity,
                            height: 240.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      // 名字
                      Container(
                        margin: new EdgeInsets.only(top: 40.0),
                        child: new Center(
                          child: new Text(
                            'KnoYo',
                            style: new TextStyle(
                                fontSize: 30.0, color: Colors.white),
                          ),
                        ),
                      ),
                      // 图标
                      Container(
                        margin: new EdgeInsets.only(top: 100.0),
                        child: new Center(
                            child: new Container(
                          width: 100.0,
                          height: 100.0,
                          child: new PreferredSize(
                            child: new Container(
                              child: new ClipOval(
                                child: new Container(
                                  color: Colors.white,
                                  child: new Image.asset(
                                      'lib/App/Rescoure/defaultIcon/ic_head_default@2x.png'),
                                ),
                              ),
                            ),
                            preferredSize: new Size(80.0, 80.0),
                          ),
                        )),
                      ),
                    ],
                  ),
                  // 内容
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                        color: Colors.blue,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[],
                          ),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                        color: Colors.green,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[],
                          ),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                        color: Colors.teal,
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[],
                          ),
                        )),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Card(
                        color: Colors.white,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: RaisedButton(
                            color: Colors.orangeAccent,
                            padding: EdgeInsets.all(5),
                            onPressed: _didClickLogoutButton,
                            child: Text('退出登录'),
                          ),
                        )),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _didClickLogoutButton() {
    print('退出登录');
    Global.removeUserInfo();
    Application.navigateToRoot(context: context, route: "${Routes.loginPage}");
  }
}

// 顶部栏裁剪
class TopBarClipper extends CustomClipper<Path> {
  // 宽高
  double width;
  double height;

  TopBarClipper(this.width, this.height);

  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(width, 0.0);
    path.lineTo(width, height / 2);
    path.lineTo(0.0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
