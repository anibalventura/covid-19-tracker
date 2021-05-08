import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid_19_app/services/api.dart';

class APIService {
  APIService(this._api);
  final API _api;

  static final Map<Endpoint, String> _responseJsonKeys = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'data',
    Endpoint.casesConfirmed: 'data',
    Endpoint.deaths: 'data',
    Endpoint.recovered: 'data',
  };

  Future<String> getAccessToken() async {
    final response = await http.post(
      _api.tokenUri(),
      headers: {'Authorization': 'Basic ${_api.apiKey}'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];

      if (accessToken != null) {
        return accessToken.toString();
      }
    }

    throw response;
  }

  Future<int> getEndpointData({
    required String accessToken,
    required Endpoint endpoint,
  }) async {
    final response = await http.get(
      _api.endpointUri(endpoint),
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body) as List<dynamic>;

      if (data.isNotEmpty) {
        final String? responseJsonKey = _responseJsonKeys[endpoint];
        final int result = data[0][responseJsonKey] as int;

        return result;
      }
    }

    throw response;
  }
}
