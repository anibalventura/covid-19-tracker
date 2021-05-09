import 'package:covid_19_app/services/api.dart';
import 'package:covid_19_app/utils/localizations.dart';
import 'package:covid_19_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.endpoint,
    required this.value,
  });

  final Endpoint? endpoint;
  final int? value;

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat('###,###');

    final Map<Endpoint, String> _titles = {
      Endpoint.cases: translate(context, AppText.cases),
      Endpoint.casesSuspected: translate(context, AppText.casesSuspected),
      Endpoint.casesConfirmed: translate(context, AppText.casesConfirmed),
      Endpoint.deaths: translate(context, AppText.deaths),
      Endpoint.recovered: translate(context, AppText.recovered),
    };

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.01.sh),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 0.02.sh,
            horizontal: 0.05.sw,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _titles[endpoint!]!,
                style: theme(context).textTheme.headline1,
              ),
              SizedBox(height: 0.01.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_pharmacy_outlined),
                  Text(
                    nf.format(value),
                    style: theme(context).textTheme.bodyText1,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
