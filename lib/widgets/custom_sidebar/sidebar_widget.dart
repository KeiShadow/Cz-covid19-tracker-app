import '../../Localization/app_localizations.dart';
import '../../config/navigation/navigation_bloc.dart';
import '../../config/themes/theme.dart';
import '../../widgets/custom_sidebar/sidebar_clipper.dart';
import '../../widgets/custom_sidebar/sidebar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Size? selectedWidgetSize;
  void onTap(int index, NavigationEvents event, context) {
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

      selectedWidgetSize = renderBox!.size;
      startYPosition = renderBox!.localToGlobal(Offset.zero).dy;
    });
    BlocProvider.of<NavigationBloc>(context).add(event);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: 110,
          left: 0,
          bottom: 0,
          top: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null || selectedWidgetSize == null)
                  ? 0
                  : startYPosition! - 20,
              (startYPosition == null || selectedWidgetSize == null)
                  ? 0
                  : startYPosition! + selectedWidgetSize!.width + 20,
            ),
            child: Container(
              decoration: BoxDecoration(color: drawerBackground),
            ),
          ),
        ),
        Positioned(
            width: 90,
            left: 0,
            bottom: 150,
            top: 50,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SidebarItem(
                        key: _overviewKey,
                        title:
                            AppLocalizations.of(context)!.translate('overview'),
                        isSelected: currentSelectedIndex == 0,
                        onTap: () => onTap(0,
                            NavigationEvents.OverviewViewClickEvent, context),
                      ),
                      SidebarItem(
                        key: _symptomsKey,
                        title:
                            AppLocalizations.of(context)!.translate('symptoms'),
                        isSelected: currentSelectedIndex == 1,
                        onTap: () => onTap(1,
                            NavigationEvents.SymptomsViewClickEvent, context),
                      ),
                      SidebarItem(
                        key: _protectionKey,
                        title: AppLocalizations.of(context)!
                            .translate('protection'),
                        isSelected: currentSelectedIndex == 2,
                        onTap: () => onTap(2,
                            NavigationEvents.ProtectionViewClickEvent, context),
                      )
                    ],
                  ),
                )
              ],
            ))
      ],
    );
  }
}
