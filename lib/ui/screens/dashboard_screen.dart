import 'package:covid_19_app/data/repository/data_repository.dart';
import 'package:covid_19_app/data/models/endpoints_model.dart';
import 'package:covid_19_app/services/api/api.dart';
import 'package:covid_19_app/utils/localizations.dart';
import 'package:covid_19_app/utils/utils.dart';
import 'package:covid_19_app/ui/widgets/endpoint_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const String route = '/dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  EndpointsData? _endpointsData;

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();

    setState(() {
      _endpointsData = endpointsData;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateData();
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
            child: RefreshIndicator(
              color: theme(context).primaryColor,
              backgroundColor: theme(context).scaffoldBackgroundColor,
              onRefresh: _updateData,
              child: ListView(
                children: [
                  for (var endpoint in Endpoint.values)
                    EndpointCard(
                      endpoint: endpoint,
                      value: _endpointsData != null
                          ? _endpointsData!.values[endpoint]
                          : 0,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
