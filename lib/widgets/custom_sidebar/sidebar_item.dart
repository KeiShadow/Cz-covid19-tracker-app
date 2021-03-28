import '../../config/themes/theme.dart';
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
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => onTap!(),
              child: RotatedBox(
                quarterTurns: -1,
                child: AnimatedDefaultTextStyle(
                    child: Text(
                      title!,
                    ),
                    style: isSelected!
                        ? listSelectedTextStyle
                        : listTileDefaultTextStyle,
                    duration: Duration(milliseconds: 200)),
              )),
        ),
        AnimatedContainer(
          height: 8,
          width: 8,
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected! ? primaryColor : Colors.transparent),
        )
      ],
    );
  }
}
