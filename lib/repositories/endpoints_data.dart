import 'package:covid_19_app/services/api.dart';

class EndpointsData {
  EndpointsData({required this.values});
  final Map<Endpoint, int> values;

  int? get cases => values[Endpoint.cases];
  int? get casesSuspected => values[Endpoint.casesSuspected];
  int? get casesConfirmed => values[Endpoint.casesConfirmed];
  int? get deaths => values[Endpoint.deaths];
  int? get recovered => values[Endpoint.recovered];
}
