import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatBlock extends StatelessWidget {
  final String? title;
  final FaIcon? icon;
  final String? value;

  const StatBlock({Key? key, this.title, this.icon, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.315;

    return Container(
        width: c_width,
        height: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            icon!,
            Text(value!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
          ],
        ));
  }
}
