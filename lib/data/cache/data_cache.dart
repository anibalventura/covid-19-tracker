import 'package:covid_19_tracker/data/models/endpoint_model.dart';
import 'package:covid_19_tracker/data/models/endpoints_model.dart';
import 'package:covid_19_tracker/services/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataCache {
  DataCache({required this.sharedPref});
  final SharedPreferences sharedPref;

  static String endpointValueKey(Endpoint endpoint) => '$endpoint/value';
  static String endpointDateKey(Endpoint endpoint) => '$endpoint/date';

  Future<void> setData(EndpointsData endpointsData) async {
    endpointsData.values.forEach((endpoint, endpointData) async {
      await sharedPref.setInt(
        endpointValueKey(endpoint),
        endpointData.value!,
      );
      await sharedPref.setString(
        endpointDateKey(endpoint),
        endpointData.date!.toIso8601String(),
      );
    });
  }

  EndpointsData getData() {
    final Map<Endpoint, EndpointData> values = {};

    // ignore: avoid_function_literals_in_foreach_calls
    Endpoint.values.forEach((endpoint) {
      final value = sharedPref.getInt(endpointValueKey(endpoint));
      final dateString = sharedPref.getString(endpointDateKey(endpoint));

      if (value != null && dateString != null) {
        final date = DateTime.tryParse(dateString);
        values[endpoint] = EndpointData(value: value, date: date);
      }
    });

    return EndpointsData(values: values);
  }
}
