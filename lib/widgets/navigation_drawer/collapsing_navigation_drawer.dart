import 'package:covid19_stats/Localization/app_localizations.dart';
import 'package:covid19_stats/config/themes/theme.dart';
import 'package:covid19_stats/model/navigation_model.dart';
import 'package:covid19_stats/widgets/navigation_drawer/collapsing_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() =>
      _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 250;
  double minWidth = 65;
  bool isCollapsed = false;
  late AnimationController _animationController;
  late Animation<double> widthAnimation;
  int currentSelectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, widget) => getWidget(context, widget));
  }

  Widget getWidget(context, widget) {
    return Container(
      width: widthAnimation.value,
      color: drawerBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  isCollapsed
                      ? _animationController.forward()
                      : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                size: 35,
                color: primaryColor,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ListView.separated(
                  itemCount: navigationItems.length,
                  separatorBuilder: (context, counter) {
                    return SizedBox(
                        height: widthAnimation.value >= maxWidth ? 5.0 : 50.0);
                  },
                  itemBuilder: (context, counter) {
                    return CollapsingListTile(
                      onTap: () {},
                      isSelected: currentSelectedIndex == counter,
                      title: AppLocalizations.of(context)!
                          .translate(navigationItems[counter].title!),
                      animationController: _animationController,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
