import 'package:covid_19_app/services/api.dart';
import 'package:covid_19_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DataRepository extends ChangeNotifier {
  DataRepository({required this.apiService});

  final APIService apiService;
  String? _accessToken;

  Future<int> getEndpointData(Endpoint endpoint) async {
    try {
      _accessToken ??= await apiService.getAccessToken();

      return await apiService.getEndpointData(
        accessToken: _accessToken!,
        endpoint: endpoint,
      );
    } on Response catch (response) {
      // If unauthorized, get access token again.
      if (response.statusCode == 401) {
        _accessToken ??= await apiService.getAccessToken();

        return apiService.getEndpointData(
          accessToken: _accessToken!,
          endpoint: endpoint,
        );
      }

      rethrow;
    }
  }
}
