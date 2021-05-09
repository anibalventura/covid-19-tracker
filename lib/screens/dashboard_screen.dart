import 'package:covid_19_app/repositories/data_repository.dart';
import 'package:covid_19_app/services/api.dart';
import 'package:covid_19_app/services/api_services.dart';
import 'package:covid_19_app/utils/localizations.dart';
import 'package:covid_19_app/utils/utils.dart';
import 'package:covid_19_app/widgets/info_card.dart';
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
        appBar: AppBar(
          title: Text(translate(context, AppText.appName)),
        ),
        body: SafeArea(
          child: Center(
            child: ListView(
              children: [
                InfoCard(
                  title: translate(context, AppText.cases),
                  value: _cases ?? 0,
                ),
                InfoCard(
                  title: translate(context, AppText.casesConfirmed),
                  value: _casesSuspected ?? 0,
                ),
                InfoCard(
                  title: translate(context, AppText.casesSuspected),
                  value: _casesConfirmed ?? 0,
                ),
                InfoCard(
                  title: translate(context, AppText.deaths),
                  value: _deaths ?? 0,
                ),
                InfoCard(
                  title: translate(context, AppText.recovered),
                  value: _recovered ?? 0,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
