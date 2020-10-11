import 'package:flutter/material.dart';

class TextThemeCustom extends TextTheme {
  @override
  TextStyle headline1 = TextStyle(fontFamily: font);
  @override
  TextStyle headline2 =
      TextStyle(fontFamily: font, fontWeight: FontWeight.bold, fontSize: 35);
  @override
  TextStyle headline3 =
      TextStyle(fontFamily: font, fontWeight: FontWeight.bold, fontSize: 19);
  @override
  TextStyle headline4 = TextStyle(fontFamily: font, fontSize: 19);
  @override
  TextStyle headline5 = TextStyle(fontFamily: font);
  @override
  TextStyle headline6 = TextStyle(fontFamily: font);
  @override
  TextStyle subtitle1 = TextStyle(fontFamily: font);
  @override
  TextStyle subtitle2 = TextStyle(fontFamily: font);
  @override
  TextStyle bodyText1 = TextStyle(fontFamily: font);
  @override
  TextStyle bodyText2 = TextStyle(fontFamily: font);

  static String get font => 'Monserrat';
}
