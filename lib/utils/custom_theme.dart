import 'package:flutter/material.dart';
import 'package:notifskripsiui/utils/constanta_colors.dart';

ThemeData myTheme() {
  return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      fontFamily: "Poppins",
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

TextTheme textTheme() {
  return TextTheme(
      button: TextStyle(
          color: textColor1, fontSize: 18.0, fontWeight: FontWeight.w700),
      bodyText1: TextStyle(color: textColor1),
      bodyText2: TextStyle(color: textColor2));
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: backgroundColor,
      brightness: Brightness.light,
      elevation: 0,
      iconTheme: IconThemeData(color: primaryColor, size: 24.0),
      textTheme: textTheme());
}
