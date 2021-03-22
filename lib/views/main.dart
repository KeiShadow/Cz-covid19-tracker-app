import 'package:covid19_stats/Localization/app_localizations.dart';
import 'package:covid19_stats/config/themes/light_theme.dart';
import 'package:covid19_stats/views/summary_view/overview_view.dart';
import 'package:covid19_stats/widgets/navigation_drawer/collapsing_navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('cs', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: lightTheme,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // fit: StackFit.passthrough,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 110, top: 100.0),
              child: CovidSummaryView()),
          Container(
              decoration: BoxDecoration(color: Colors.white),
              child: CollapsingNavigationDrawer()),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
