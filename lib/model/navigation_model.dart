import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationModel {
  String? title;
  IconData? iconData;
  NavigationModel({this.title, this.iconData});
}

//TODO: Localization

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Summary', iconData: FontAwesomeIcons.chartBar),
  NavigationModel(title: 'Symptoms', iconData: FontAwesomeIcons.disease),
  NavigationModel(title: 'Protection', iconData: FontAwesomeIcons.shieldVirus),
];
