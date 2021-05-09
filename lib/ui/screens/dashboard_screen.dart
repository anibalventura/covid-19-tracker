import 'dart:io';

import 'package:covid_19_app/data/repository/data_repository.dart';
import 'package:covid_19_app/data/models/endpoints_model.dart';
import 'package:covid_19_app/services/api/api.dart';
import 'package:covid_19_app/ui/widgets/last_update_text.dart';
import 'package:covid_19_app/ui/widgets/snackbar.dart';
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
                    endpointsData: _endpointsData,
                  ),
                  for (var endpoint in Endpoint.values)
                    EndpointCard(
                      endpoint: endpoint,
                      endpointsData: _endpointsData,
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
