import 'dart:convert';

import 'package:covid19_stats/model/covid_api_model.dart';
import 'package:http/http.dart' as http;

Future<CovidOverview> fetchCovidMainData() async {
  final response = await http.get(Uri.https(
      'onemocneni-aktualne.mzcr.cz', '/api/v2/covid-19/zakladni-prehled.json'));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(jsonDecode(response.body));
    return CovidOverview.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
