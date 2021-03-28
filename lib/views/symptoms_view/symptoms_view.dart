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
        SizedBox(
          height: 5,
        ),
        TopHeaderView(context),
      ],
    );
  }

  Widget TopHeaderView(context) {
    return Container(
      height: 150.0,
      width: 220.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Subtext
          Text(
            AppLocalizations.of(context)!.translate('covid19Subtitle'),
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            height: 10,
          ),
          //InfoText
        ],
      ),
    );
  }
}
