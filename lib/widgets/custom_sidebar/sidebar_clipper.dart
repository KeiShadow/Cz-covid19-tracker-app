import 'package:flutter/cupertino.dart';

class SidebarClipper extends CustomClipper<Path> {
  final double? startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path()
      ..lineTo(-height / 3, width + endYPosition!)
      ..lineTo(height + width, startYPosition! + width)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
