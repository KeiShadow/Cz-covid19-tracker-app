import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollapsingListTile extends StatefulWidget {
  final String? title;
  final IconData? iconData;
  final AnimationController? animationController;
  final bool? isSelected;
  final Function? onTap;

  CollapsingListTile(
      {Key? key,
      @required this.title,
      @required this.iconData,
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
        Tween<double>(begin: 250, end: 75).animate(widget.animationController!);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onTap!,
      child: Container(
        width: widthAnimation.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            FaIcon(
              widget.iconData!,
              size: 30.0,
              color: widget.isSelected!
                  ? changeSelectedColorIcon(context)
                  : changeunSelectedColorIcon(context),
            ),
            SizedBox(width: 10),
            (widthAnimation.value >= 220)
                ? Text(
                    widget.title!,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: widget.isSelected!
                            ? changeSelectedColorIcon(context)
                            : changeunSelectedColorIcon(context)),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Color changeSelectedColorIcon(context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white;
  Color changeunSelectedColorIcon(context) =>
      Theme.of(context).brightness == Brightness.light
          ? Colors.grey.shade700
          : Colors.white60;
}
