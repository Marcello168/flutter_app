import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';
import 'package:flutter_app/App/General/Common/Global.dart';
import 'package:flutter_app/App/General/Common/User.dart';
import 'package:flutter_app/App/General/Router/routes.dart';
import 'package:flutter_app/App/General/Utils/Application.dart';

class LoginPage extends BasePage {
  LoginPage({Key key}) : super(key: key);

  LoginPageView createState() => LoginPageView();
}

class LoginPageView extends BasePageView {
  bool isBackArrowShow = false; //返回箭头是否显示
  String appBarTitle = '登录';

  _didClickLoginButton() {
    print('登录');

    /// 登录后 保存用户信息
    Global.user = User(
        name: 'Marcello', token: 'lfsdkafklds', phone: '1511', avatar: 'ss');
    Global.saveUserInfo();
    Application.navigateToRoot(context: context, route: "${Routes.mainPage}");
  }

  @override
  Widget renderView() {
    // TODO: implement renderView
    return Container(
      color: Colors.orange,
      child: Center(
        child: RaisedButton(
          onPressed: this._didClickLoginButton,
          child: Text('登录'),
        ),
      ),
    );
  }
}
