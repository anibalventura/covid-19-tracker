import 'package:covid_19_tracker/data/models/endpoints_model.dart';
import 'package:covid_19_tracker/services/api/api.dart';
import 'package:covid_19_tracker/utils/localizations.dart';
import 'package:covid_19_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LastUpdateText extends StatelessWidget {
  const LastUpdateText({
    required this.endpointsData,
  });

  final EndpointsData? endpointsData;

  @override
  Widget build(BuildContext context) {
    String _lastUpdatedText() {
      if (endpointsData != null) {
        final DateFormat formatter = DateFormat('d MMM yyyy').add_Hms();
        final String date =
            formatter.format(endpointsData!.values[Endpoint.cases]!.date!);
        return '${translate(context, AppText.lastUpdated)} $date';
      }
      return '';
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.005.sh),
      child: Text(
        _lastUpdatedText(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
