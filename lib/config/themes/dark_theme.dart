import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
  cardColor: Colors.black54,
  shadowColor: Colors.grey.withOpacity(0.2),
  textTheme: TextTheme(
    headline6: TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.w800, letterSpacing: 2.0),
    subtitle1: TextStyle(fontSize: 16.0, color: Colors.red.shade800),
  ),
);
