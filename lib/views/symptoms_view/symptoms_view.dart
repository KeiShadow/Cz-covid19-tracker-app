import 'package:covid19_stats/Localization/app_localizations.dart';
import '../../config/navigation/navigation_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SymptomsView extends StatefulWidget with NavigationStates {
  @override
  _SymptomsViewState createState() => _SymptomsViewState();
}

class _SymptomsViewState extends State<SymptomsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.translate('symptoms'),
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
