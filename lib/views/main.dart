import '../views/overview_view/overview_view.dart';

import '../config/navigation/navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Localization/app_localizations.dart';
import '../config/themes/light_theme.dart';
import '../widgets/custom_sidebar/sidebar_widget.dart';
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
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (cotnext) => NavigationBloc(OverviewView()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return Padding(
                    padding: EdgeInsets.only(left: 110, top: 90.0),
                    child: navigationState as Widget);
              },
            ),
            SidebarWidget(),
          ],
        ),
      ),
    );
  }
}
