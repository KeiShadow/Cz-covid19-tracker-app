import 'package:covid19_stats/Localization/app_localizations.dart';
import 'package:covid19_stats/config/themes/theme.dart';
import 'package:covid19_stats/widgets/custom_sidebar/sidebar_clipper.dart';
import 'package:covid19_stats/widgets/custom_sidebar/sidebar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarWidget extends StatefulWidget {
  @override
  _SidebarWidgetState createState() => _SidebarWidgetState();
}

class _SidebarWidgetState extends State<SidebarWidget> {
  int currentSelectedIndex = 0;

  LabeledGlobalKey _overviewKey = LabeledGlobalKey('overviewKey');
  LabeledGlobalKey _symptomsKey = LabeledGlobalKey('symptomsKey');
  LabeledGlobalKey _protectionKey = LabeledGlobalKey('protectionKey');

  RenderBox? renderBox;
  double? startYPosition;

  void onTap(int index) {
    setState(() {
      currentSelectedIndex = index;
      switch (currentSelectedIndex) {
        case 0:
          renderBox =
              (_overviewKey.currentContext!.findRenderObject() as RenderBox?);
          break;
        case 1:
          renderBox =
              (_symptomsKey.currentContext!.findRenderObject() as RenderBox?);
          break;
        case 2:
          renderBox =
              (_protectionKey.currentContext!.findRenderObject() as RenderBox?);
          break;
      }

      startYPosition = renderBox!.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          width: 90,
          left: 0,
          bottom: 0,
          top: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null) ? 0 : startYPosition! - 40,
              (startYPosition == null) ? 0 : startYPosition! + 80,
            ),
            child: Container(
              decoration: BoxDecoration(color: Colors.amber),
            ),
          ),
        ),
        Positioned(
          left: -15,
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.menu,
                size: 30,
                color: primaryColor,
              ),
              SizedBox(
                height: 80,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SidebarItem(
                      key: _overviewKey,
                      title:
                          AppLocalizations.of(context)!.translate('overview'),
                      isSelected: currentSelectedIndex == 0,
                      onTap: () => onTap(0),
                    ),
                    SidebarItem(
                      key: _symptomsKey,
                      title:
                          AppLocalizations.of(context)!.translate('symptoms'),
                      isSelected: currentSelectedIndex == 1,
                      onTap: () => onTap(1),
                    ),
                    SidebarItem(
                      key: _protectionKey,
                      title:
                          AppLocalizations.of(context)!.translate('protection'),
                      isSelected: currentSelectedIndex == 2,
                      onTap: () => onTap(2),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 250,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/**
 *
 */
