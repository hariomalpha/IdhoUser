import 'dart:ui';

import 'package:flutter/cupertino.dart';

class MyColorName {
  static const Color primaryLite = Color(0xFFdc2328);
  static const Color primaryDark = Color(0xffFDE869);
  static const Color appbarBg = Color(0xFFdc2328);
  static const Color colorTextPrimary = Color(0xff28728D);
  static const Color colorTextSecondary = Color(0xff474747);
  static const Color colorTextFour = Color(0xff10275A);
  static const Color colorEdit = Color(0xfffafafa);
  static const Color colorView = Color(0xFFdc2328);
  static const Color colorIcon = Color(0xffBF2330);
  static const Color colorTextThird = Color(0xff10275A);
  static const Color colorBg2 = Color(0xffDCEDF7);
  static const Color colorBg1 = Color(0xffFFFFFF);
  static const Color colorButton = Color(0xff0D7ACF);
  static const Color colorMainButton = Color(0xffFF3148);
}

class MyGradients{
  static  LinearGradient linearGradient = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [
      Color(0xFFffc40c),
      Color(0xFFdc2328),
    ],
  );
}