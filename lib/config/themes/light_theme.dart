import 'package:covid19_stats/config/themes/theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  fontFamily: 'DM Sans',
  textTheme: TextTheme(
    headline6: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.5,
        color: Colors.black),
    subtitle1: TextStyle(
        fontSize: 12.0, color: primaryColor, fontWeight: FontWeight.w700),
    subtitle2: TextStyle(
        fontSize: 14.0,
        color: secondaryColor.shade700,
        height: 1.8,
        fontWeight: FontWeight.w400),
  ),
);
