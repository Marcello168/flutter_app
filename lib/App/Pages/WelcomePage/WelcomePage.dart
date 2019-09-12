import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Base/BasePage.dart';

class WelcomePage extends BasePage {
  WelcomePage({Key key}) : super(key: key);

  WelcomePageView createState() => new WelcomePageView();
}

class WelcomePageView extends BasePageView {
  bool isNavigationBarShow = false;
  @override
  Widget renderView() {
    // TODO: implement renderView
    return Text('WelcomePageView');
  }
}
