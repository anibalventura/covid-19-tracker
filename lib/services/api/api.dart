import 'package:covid_19_tracker/services/api/api_keys.dart';
import 'package:flutter/material.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  API({@required this.apiKey});
  final String? apiKey;
  factory API.sandbox() => API(apiKey: APIKeys.covSandboxKey);

  static const String _host = "ncov2019-admin.firebaseapp.com";

  static final Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.casesSuspected: 'casesSuspected',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: _host,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: _host,
        path: _paths[endpoint],
      );
}
