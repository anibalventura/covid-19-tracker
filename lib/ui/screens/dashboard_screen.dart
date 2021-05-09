import 'dart:io';

import 'package:covid_19_tracker/data/repository/data_repository.dart';
import 'package:covid_19_tracker/data/models/endpoints_model.dart';
import 'package:covid_19_tracker/services/api/api.dart';
import 'package:covid_19_tracker/ui/widgets/last_update_text.dart';
import 'package:covid_19_tracker/ui/widgets/snackbar.dart';
import 'package:covid_19_tracker/utils/localizations.dart';
import 'package:covid_19_tracker/utils/utils.dart';
import 'package:covid_19_tracker/ui/widgets/endpoint_card.dart';
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
    try {
      final dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointsData = await dataRepository.getAllEndpointsData();
      setState(() {
        _endpointsData = endpointsData;
      });
    } on SocketException catch (_) {
      showSnackbar(
        context: context,
        msg: translate(context, AppText.errorNoInternet),
      );
    } catch (_) {
      showSnackbar(
        context: context,
        msg: translate(context, AppText.errorGeneral),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _endpointsData = Provider.of<DataRepository>(context, listen: false)
        .getAllEndpointsCachedData();
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
                  LastUpdateText(
                    lastUpdateText: _endpointsData != null
                        ? _endpointsData!.values[Endpoint.cases]?.date
                        : null,
                  ),
                  for (var endpoint in Endpoint.values)
                    EndpointCard(
                      endpoint: endpoint,
                      value: _endpointsData != null
                          ? _endpointsData!.values[endpoint]?.value
                          : null,
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
