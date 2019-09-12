import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';

class LoginPage extends BasePage {
  LoginPage({Key key}) : super(key: key);

  LoginPageView createState() => LoginPageView();
}

class LoginPageView extends BasePageView {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('LoginPage'),
    );
  }
}
