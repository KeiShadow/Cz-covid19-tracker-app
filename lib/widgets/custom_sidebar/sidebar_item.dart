import 'package:covid19_stats/config/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarItem extends StatelessWidget {
  final String? title;
  final bool? isSelected;
  final Function? onTap;

  SidebarItem({Key? key, @required this.title, this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
        angle: -1.58,
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => onTap!(),
          child: Column(
            children: [
              AnimatedDefaultTextStyle(
                  child: Text(
                    title!,
                  ),
                  style: isSelected!
                      ? listSelectedTextStyle
                      : listTileDefaultTextStyle,
                  duration: Duration(milliseconds: 200)),
              AnimatedContainer(
                height: 6,
                width: 6,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected! ? Colors.black : Colors.transparent),
              )
            ],
          ),
        ));
  }
}
