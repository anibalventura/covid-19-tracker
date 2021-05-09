import 'package:covid_19_app/data/model/endpoints_model.dart';
import 'package:covid_19_app/services/api/api.dart';
import 'package:covid_19_app/services/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DataRepository extends ChangeNotifier {
  DataRepository({required this.apiService});

  final APIService apiService;
  String? _accessToken;

  // Future<int> getEndpointData(Endpoint endpoint) async {
  //   return _getDataRefreshingToken<int>(
  //     onGetData: () => apiService.getEndpointData(
  //         accessToken: _accessToken!, endpoint: endpoint),
  //   );
  // }

  Future<EndpointsData> getAllEndpointsData() async {
    return _getDataRefreshingToken<EndpointsData>(
      onGetData: _getAllEndpointsData,
    );
  }

  Future<T> _getDataRefreshingToken<T>({
    required Future<T> Function() onGetData,
  }) async {
    try {
      _accessToken ??= await apiService.getAccessToken();
      return await onGetData();
    } on Response catch (response) {
      // if unauthorized, get access token again
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return onGetData();
      }

      rethrow;
    }
  }

  Future<EndpointsData> _getAllEndpointsData() async {
    final values = await Future.wait([
      apiService.getEndpointData(
          accessToken: _accessToken!, endpoint: Endpoint.cases),
      apiService.getEndpointData(
          accessToken: _accessToken!, endpoint: Endpoint.casesSuspected),
      apiService.getEndpointData(
          accessToken: _accessToken!, endpoint: Endpoint.casesConfirmed),
      apiService.getEndpointData(
          accessToken: _accessToken!, endpoint: Endpoint.deaths),
      apiService.getEndpointData(
          accessToken: _accessToken!, endpoint: Endpoint.recovered),
    ]);

    return EndpointsData(
      values: {
        Endpoint.cases: values[0],
        Endpoint.casesSuspected: values[1],
        Endpoint.casesConfirmed: values[2],
        Endpoint.deaths: values[3],
        Endpoint.recovered: values[4],
      },
    );
  }
}