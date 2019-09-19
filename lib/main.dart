import 'package:flutter/material.dart';
import 'package:flutter_app/App/General/Common/Global.dart';
import 'package:flutter_app/App/General/Router/routes.dart';
import 'package:flutter_app/App/General/Utils/Application.dart';
import './App/Pages/WelcomePage/WelcomePage.dart';
import 'package:fluro/fluro.dart';
import 'package:oktoast/oktoast.dart';

void main() => Global.init().then((e) => runApp(App()));

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  dynamic subscription;

  @override
  void initState() {
    super.initState();
    final Router router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          platform: TargetPlatform.iOS,
          primarySwatch: Colors.blue,
        ),
        home: WelcomePage(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
