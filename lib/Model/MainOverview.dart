import 'package:flutter/material.dart';

class CovidOverview {
  final String? datum;
  final int? testsPerfomed;
  final int? confirmedCases;
  final int? todayConfirmedCases;
  final int? activeCases;
  final int? healing;
  final int? death;

  CovidOverview({
    @required this.datum,
    @required this.testsPerfomed,
    @required this.confirmedCases,
    @required this.todayConfirmedCases,
    @required this.activeCases,
    @required this.healing,
    @required this.death,
  });

  factory CovidOverview.fromJson(Map<String, dynamic> json) {
    return CovidOverview(
      datum: json['data'][0]['datum'],
      testsPerfomed: json['data'][0]['provedene_testy_celkem'],
      confirmedCases: json['data'][0]['potvrzene_pripady_celkem'],
      todayConfirmedCases: json['data'][0]['potvrzene_pripady_dnesni_den'],
      activeCases: json['data'][0]['aktivni_pripady'],
      healing: json['data'][0]['vyleceni'],
      death: json['data'][0]['umrti'],
    );
  }
}
