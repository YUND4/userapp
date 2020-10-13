import 'package:flutter/material.dart';
import 'package:userapp/src/Services/Client.service.dart';
import 'package:userapp/src/pages/Init.page.dart';
import 'package:userapp/src/utils/Routes.util.dart';
import 'package:userapp/src/utils/Text.utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextThemeCustom(),
      ),
      home: InitPage(),
      routes: Routes.getRoutes(),
    );
  }
}
