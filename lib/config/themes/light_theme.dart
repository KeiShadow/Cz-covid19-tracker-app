import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey,
  brightness: Brightness.light,
  backgroundColor: Colors.grey[200],
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
  cardColor: Colors.white,
  shadowColor: Colors.grey.withOpacity(0.2),
  textTheme: TextTheme(
    headline6: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w800,
        letterSpacing: 2.0,
        color: Colors.black),
    subtitle1: TextStyle(fontSize: 14.0, color: Colors.red),
  ),
);
