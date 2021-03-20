import 'package:covid19_stats/CustomSwitch/CustomSwitch.dart';
import 'package:covid19_stats/Notifier/ThemeNotifier.dart';
import 'package:covid19_stats/Services/storage_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitch extends StatefulWidget {
  final ThemeNotifier? theme;

  const AnimatedSwitch({
    Key? key,
    this.theme,
  }) : super(key: key);

  @override
  _AnimatedSwitchState createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch> {
  bool? isSwitched = false;

  @protected
  @mustCallSuper
  void initState() {
    super.initState();
    StorageManager.readData('themeMode').then((value) {
      var themeMode = value ?? 'light';
      if (themeMode == 'light')
        setState(() => isSwitched = false);
      else
        setState(() => isSwitched = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomSwitch(
      value: isSwitched!,
      onChanged: (value) {
        if (isSwitched!)
          widget.theme!.setLightMode();
        else
          widget.theme!.setDarkMode();

        setState(() {
          isSwitched = value;
          print(isSwitched);
        });
      },
    );
  }
}
