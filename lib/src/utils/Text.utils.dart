import 'package:flutter/material.dart';

import 'HexColor.util.dart';

class TextThemeCustom extends TextTheme {
  @override
  TextStyle headline1 = TextStyle(fontFamily: font);
  @override
  TextStyle headline2 = TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Colors.white);
  @override
  TextStyle headline3 = TextStyle(
      fontFamily: font,
      fontWeight: FontWeight.bold,
      fontSize: 19,
      color: Colors.white,
      letterSpacing: 3);
  @override
  TextStyle headline4 = TextStyle(
    fontFamily: font,
    fontSize: 19,
    color: Colors.black,
  );
  @override
  TextStyle headline5 = TextStyle(
    fontFamily: font,
    fontSize: 16,
    color: Colors.black,
  );
  @override
  TextStyle headline6 = TextStyle(
    fontFamily: font,
    fontSize: 16,
    color: HexColor('#FEDD7C'),
  );
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
