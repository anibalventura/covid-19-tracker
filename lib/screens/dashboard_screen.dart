import 'package:covid_19_app/repositories/data_repository.dart';
import 'package:covid_19_app/services/api.dart';
import 'package:covid_19_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int? _cases;
  int? _casesSuspected;
  int? _casesConfirmed;
  int? _deaths;
  int? _recovered;

  @override
  void initState() {
    super.initState();
    _updateCases();
  }

  void _updateCases() async {
    final apiService = APIService(API.sandbox());
    final accessToken = await apiService.getAccessToken();

    final cases = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.cases,
    );
    final casesSuspected = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.casesSuspected,
    );
    final casesConfirmed = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.casesConfirmed,
    );
    final deaths = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.deaths,
    );
    final recovered = await apiService.getEndpointData(
      accessToken: accessToken,
      endpoint: Endpoint.recovered,
    );

    setState(() {
      _cases = cases;
      _casesSuspected = casesSuspected;
      _casesConfirmed = casesConfirmed;
      _deaths = deaths;
      _recovered = recovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataRepository>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(title: Text('COVID-19 Tracker')),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_cases != null)
                  Text(
                    'Cases: $_cases',
                    style: TextStyle(color: Colors.white),
                  ),
                if (_casesSuspected != null)
                  Text(
                    'Cases Suspected: $_casesSuspected',
                    style: TextStyle(color: Colors.white),
                  ),
                if (_casesConfirmed != null)
                  Text(
                    'Cases Confirmed: $_casesConfirmed',
                    style: TextStyle(color: Colors.white),
                  ),
                if (_deaths != null)
                  Text(
                    'Deaths: $_deaths',
                    style: TextStyle(color: Colors.white),
                  ),
                if (_recovered != null)
                  Text(
                    'Recovered: $_recovered',
                    style: TextStyle(color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
