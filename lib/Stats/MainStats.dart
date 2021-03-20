import 'package:covid19_stats/Localization/app_localizations.dart';
import 'package:covid19_stats/Model/MainOverview.dart';
import 'package:covid19_stats/Stats/StatBlock.dart';
import 'package:covid19_stats/fetch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MainStats extends StatefulWidget {
  const MainStats({Key? key}) : super(key: key);

  @override
  _MainStatsState createState() => _MainStatsState();
}

class _MainStatsState extends State<MainStats> {
  late Future<CovidOverview> futureCovidStats;
  @override
  void initState() {
    super.initState();
    futureCovidStats = fetchCovidMainData();
    print(futureCovidStats);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CovidOverview>(
      future: futureCovidStats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatBlock(
                      icon: FaIcon(
                        FontAwesomeIcons.viruses,
                        size: 25,
                      ),
                      title: AppLocalizations.of(context)!
                          .translate('todayConfirmedCases'),
                      value: NumberFormat.decimalPattern()
                          .format(snapshot.data!.todayConfirmedCases),
                    ),
                    StatBlock(
                      icon: FaIcon(
                        FontAwesomeIcons.virus,
                        size: 25,
                      ),
                      title: AppLocalizations.of(context)!
                          .translate('confirmedCases'),
                      value: NumberFormat.decimalPattern()
                          .format(snapshot.data!.confirmedCases),
                    ),
                    StatBlock(
                      icon: FaIcon(
                        FontAwesomeIcons.virusSlash,
                        size: 25,
                      ),
                      title: AppLocalizations.of(context)!
                          .translate('activeCases'),
                      value: NumberFormat.decimalPattern()
                          .format(snapshot.data!.healing),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatBlock(
                      icon: FaIcon(
                        FontAwesomeIcons.microscope,
                        size: 25,
                      ),
                      title: AppLocalizations.of(context)!
                          .translate('testsPerformed'),
                      value: NumberFormat.decimalPattern()
                          .format(snapshot.data!.testsPerfomed),
                    ),
                    StatBlock(
                      icon: FaIcon(
                        FontAwesomeIcons.houseUser,
                        size: 25,
                      ),
                      title: AppLocalizations.of(context)!.translate('healing'),
                      value: NumberFormat.decimalPattern()
                          .format(snapshot.data!.healing),
                    ),
                    StatBlock(
                      icon: FaIcon(
                        FontAwesomeIcons.skullCrossbones,
                        size: 25,
                      ),
                      title: AppLocalizations.of(context)!.translate('death'),
                      value: NumberFormat.decimalPattern()
                          .format(snapshot.data!.death),
                    )
                  ],
                ),
              )
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
