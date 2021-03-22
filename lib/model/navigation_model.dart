import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationModel {
  String? title;
  IconData? iconData;

  NavigationModel({this.title, this.iconData});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'overview', iconData: FontAwesomeIcons.chartBar),
  NavigationModel(title: 'symptoms', iconData: FontAwesomeIcons.disease),
  NavigationModel(title: 'protection', iconData: FontAwesomeIcons.shieldVirus),
];
//TODO: Localization


