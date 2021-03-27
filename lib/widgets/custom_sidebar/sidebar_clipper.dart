import 'package:flutter/cupertino.dart';

class SidebarClipper extends CustomClipper<Path> {
  final double? startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Rect rect = Rect.fromPoints(Offset(0, 0), Offset(width - 50, height));

    Path path = Path()
      ..addRect(rect)
      ..moveTo(width / 2, startYPosition!)
      ..quadraticBezierTo(
        width + 15,
        startYPosition! + width / 2,
        width / 2,
        endYPosition!,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
