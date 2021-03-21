import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StatBlock extends StatelessWidget {
  final String? title;
  final FaIcon? icon;
  final String? value;

  const StatBlock({Key? key, this.title, this.icon, this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.3;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          width: cWidth,
          height: 120,
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title!,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                ),
                icon!,
                Text(value!,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
          )),
    );
  }
}
