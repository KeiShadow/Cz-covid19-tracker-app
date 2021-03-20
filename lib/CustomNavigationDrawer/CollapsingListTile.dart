import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CollapsingListTile extends StatefulWidget {
  final String? title;
  final IconData? iconData;

  CollapsingListTile({
    Key? key,
    @required this.title,
    @required this.iconData,
  }) : super(key: key);

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: [
          FaIcon(
            widget.iconData!,
            size: 38.0,
          ),
          SizedBox(width: 10),
          Text(
            widget.title!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
