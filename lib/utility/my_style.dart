import 'package:flutter/material.dart';

class MyStyle {
  static Color dart = Color(0xff5b0092);
  static Color primary = Color(0xff8f1cc4);
  static Color light = Color(0xffc455f8);

  TextStyle h1Style() => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: dart,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: dart,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: dart,
      );
}
