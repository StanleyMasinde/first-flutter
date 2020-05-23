import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
        backgroundColor: Colors.red,
        actionsIconTheme: Theme.of(context).iconTheme,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => {},
          )
        ],
      ),
      body: StatsBody(),
    );
  }
}

/// Stats body that is stateful
/// it has to return a widget to the body of this page

class StatsBody extends StatefulWidget {
  @override
  _StatsBodyState createState() => _StatsBodyState();
}

class _StatsBodyState extends State<StatsBody> {
  Future<CovidStatsKenya> futureStats;
  @override
  void initState() {
    super.initState();
    futureStats = getStats();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<CovidStatsKenya>(
      future: futureStats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var cases = snapshot.data.cases;
          var todayCases = snapshot.data.todayCases;
          var criticaCases = snapshot.data.todayCases;
          var deaths = snapshot.data.deaths;
          var recoverd = snapshot.data.recovered;
          var active = snapshot.data.active;
          var tests = snapshot.data.tests;
          var newDeaths = snapshot.data.todayDeaths;

          return Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 80.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Total Cases',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$cases',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 80.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'New Cases',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$todayCases',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Critical Cases',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$criticaCases',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Recoveries',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$recoverd',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Active Cases',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$active',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Casualties',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$deaths',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'New Deaths',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$newDeaths',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200.0,
                      height: 100.0,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Number of tests',
                              style: Theme.of(context).textTheme.headline5,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '$tests',
                              style: Theme.of(context).textTheme.headline4,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

///
///Fetch the stats from https://corona.lmao.ninja/v2/countries/kenya
///
Future<CovidStatsKenya> getStats() async {
  final respose =
      await http.get('https://corona.lmao.ninja/v2/countries/kenya');

  if (respose.statusCode == 200) {
    return CovidStatsKenya.fromJson(jsonDecode(respose.body));
  } else {
    throw Exception('Failed to get stats');
  }
}

///
/// Convert stats into JSON
///
class CovidStatsKenya {
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int active;
  final int critical;
  final int tests;

  CovidStatsKenya(
      {this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.active,
      this.critical,
      this.tests});

  factory CovidStatsKenya.fromJson(Map<String, dynamic> json) {
    return CovidStatsKenya(
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      active: json['active'],
      critical: json['critical'],
      tests: json['tests'],
    );
  }
}
