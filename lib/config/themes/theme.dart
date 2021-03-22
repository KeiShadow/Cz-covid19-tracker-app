import 'package:covid19_stats/config/themes/color_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Colors
Color drawerBackground = Color.fromARGB(90, 252, 238, 239);
MaterialColor primaryColor =
    MaterialColor(Color(0xFFED6672).value, getSwatch(Color(0xFFED6672)));
MaterialColor secondaryColor =
    MaterialColor(Color(0xFFF44336).value, getSwatch(Color(0xFFF44336)));

//TextStyles
TextStyle listTileDefaultTextStyle = TextStyle(
    color: primaryColor.shade200,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'DM Sans',
    letterSpacing: 0.2,
    height: 1.4);
TextStyle listSelectedTextStyle = TextStyle(
    color: primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontFamily: 'DM Sans',
    letterSpacing: 0.2,
    height: 1.4);
