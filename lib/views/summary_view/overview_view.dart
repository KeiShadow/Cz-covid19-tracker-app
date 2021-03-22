import 'package:covid19_stats/Localization/app_localizations.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CovidSummaryView extends StatefulWidget {
  @override
  _CovidSummaryViewState createState() => _CovidSummaryViewState();
}

class _CovidSummaryViewState extends State<CovidSummaryView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.translate('overview'),
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(
          height: 5,
        ),
        TopHeaderView(context),
        // TODO: Graph
      ],
    );
  }
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
        Text(AppLocalizations.of(context)!.translate('whatIsCovid'),
            style: Theme.of(context).textTheme.subtitle2),
      ],
    ),
  );
}
