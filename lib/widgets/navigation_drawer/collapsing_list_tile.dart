import 'package:covid19_stats/config/themes/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollapsingListTile extends StatefulWidget {
  final String? title;

  final AnimationController? animationController;
  final bool? isSelected;
  final Function? onTap;

  CollapsingListTile(
      {Key? key,
      @required this.title,
      @required this.animationController,
      this.isSelected,
      this.onTap})
      : super(key: key);

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  late Animation<double> widthAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 250, end: 65).animate(widget.animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap!,
      child: Container(
        width: widthAnimation.value + 40,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
        child: Row(
          children: [
            SizedBox(width: 10),
            RotatedBox(
              quarterTurns: (widthAnimation.value >= 220) ? 0 : 1,
              child: Text(
                widget.title!,
                style: widget.isSelected!
                    ? listSelectedTextStyle
                    : listTileDefaultTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
