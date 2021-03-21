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
          body: Stack(
            // fit: StackFit.passthrough,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [AnimatedSwitch(theme: theme)],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      MainStats(),
                    ],
                  ),
                ),
              ),
              CollapsingNavigationDrawer(),
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ),
      ),
    );
  }
}
