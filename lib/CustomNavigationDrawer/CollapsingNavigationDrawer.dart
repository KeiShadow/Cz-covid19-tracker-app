import 'package:covid19_stats/CustomNavigationDrawer/CollapsingListTile.dart';
import 'package:covid19_stats/Model/NavigationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState
    extends State<CollapsingNavigationDrawer> {
  double maxWidth = 250;
  double minWidth = 70;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(),
          Expanded(
            child: ListView.builder(
                itemCount: navigationItems.length,
                itemBuilder: (context, counter) {
                  return CollapsingListTile(
                      title: navigationItems[counter].title!,
                      iconData: navigationItems[counter].iconData!);
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: 40,
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black87
                  : Colors.white,
            ),
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
