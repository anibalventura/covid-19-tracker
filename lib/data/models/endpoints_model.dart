import 'package:covid_19_tracker/data/models/endpoint_model.dart';
import 'package:covid_19_tracker/services/api/api.dart';

class EndpointsData {
  EndpointsData({required this.values});
  final Map<Endpoint, EndpointData> values;

  EndpointData? get cases => values[Endpoint.cases];
  EndpointData? get casesSuspected => values[Endpoint.casesSuspected];
  EndpointData? get casesConfirmed => values[Endpoint.casesConfirmed];
  EndpointData? get deaths => values[Endpoint.deaths];
  EndpointData? get recovered => values[Endpoint.recovered];
}
