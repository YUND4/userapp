import 'package:flutter/widgets.dart';
import 'package:userapp/src/pages/Home.page.dart';
import 'package:userapp/src/pages/Init.page.dart';
import 'package:userapp/src/pages/Login.page.dart';

class Routes {
  static getRoutes() => {
        'init': (BuildContext context) => InitPage(),
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
      };
}
