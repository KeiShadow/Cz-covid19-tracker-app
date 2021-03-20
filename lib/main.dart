import 'package:covid19_stats/CustomNavigationDrawer/CollapsingNavigationDrawer.dart';
import 'package:covid19_stats/CustomSwitch/AnimatedSwitch.dart';
import 'package:covid19_stats/Localization/app_localizations.dart';
import 'package:covid19_stats/Notifier/ThemeNotifier.dart';
import 'package:covid19_stats/Stats/MainStats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('cs', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: theme.getTheme(),
        home: Scaffold(
          drawer: CollapsingNavigationDrawer(),
          appBar: AppBar(
            bottomOpacity: 0.0,
            elevation: 0.0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: AnimatedSwitch(theme: theme),
              )
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                MainStats(),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
