import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        canvasColor: Color(0xffdae4ee),
        dividerColor: Color(0xffc0c7d5),
        cardColor: Color(0xffe4e4e8),
        focusColor: Color(0xff000000),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      canvasColor: Color(0xff181b23), //maincolor
      dividerColor: Color(0xff343844), //canvascolor
      cardColor: Color(0xff000000), //btncolor
      focusColor: Color(0xffffffff) //fontcolor
      );
}
