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
      children: [
        TopHeaderView(context),
        //Fetch api
      ],
    );
  }
}

Widget TopHeaderView(context) {
  return Container(
    height: 150.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: Theme.of(context).textTheme.headline6,
        ),
        //Subtext
        Text(
          'Covid-19 Disease',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        //InfoText
        Text('INFO'),
        //Graf
        Text('Covid cases'),
        //Fetch api
      ],
    ),
  );
}
