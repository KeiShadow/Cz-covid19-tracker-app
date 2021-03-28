import '../../config/themes/theme.dart';
import '../../widgets/custom_sidebar/sidebar_clipper.dart';
import 'package:flutter/cupertino.dart';

class BackgroundWidget extends StatelessWidget {
  BackgroundWidget(
      {Key? key,
      @required this.startYPosition,
      @required this.selectedWidgetSize})
      : super(key: key);

  final double? startYPosition;
  final Size? selectedWidgetSize;

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
