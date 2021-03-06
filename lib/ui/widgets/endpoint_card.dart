import 'package:covid_19_tracker/data/models/endpoint_card_model.dart';
import 'package:covid_19_tracker/services/api/api.dart';
import 'package:covid_19_tracker/utils/localizations.dart';
import 'package:covid_19_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EndpointCard extends StatelessWidget {
  const EndpointCard({
    required this.endpoint,
    required this.value,
  });

  final Endpoint? endpoint;
  final int? value;

  @override
  Widget build(BuildContext context) {
    final Map<Endpoint, EndpointCardData> _cardsData = {
      Endpoint.cases: EndpointCardData(
        title: translate(context, AppText.cases),
        assetName: AppText.cases,
        color: Colors.orange,
      ),
      Endpoint.casesSuspected: EndpointCardData(
        title: translate(context, AppText.casesSuspected),
        assetName: AppText.casesSuspected,
        color: Colors.grey,
      ),
      Endpoint.casesConfirmed: EndpointCardData(
        title: translate(context, AppText.casesConfirmed),
        assetName: AppText.casesConfirmed,
        color: Colors.blue,
      ),
      Endpoint.deaths: EndpointCardData(
        title: translate(context, AppText.deaths),
        assetName: AppText.deaths,
        color: Colors.red,
      ),
      Endpoint.recovered: EndpointCardData(
        title: translate(context, AppText.recovered),
        assetName: AppText.recovered,
        color: Colors.green,
      ),
    };

    final EndpointCardData _cardData = _cardsData[endpoint]!;

    String _endpointValue() {
      if (value != null) {
        final nf = NumberFormat('#,###');
        return nf.format(value);
      }
      return '-';
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenPortrait() ? 0.01.sh : 0.02.sh,
      ),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: screenPortrait() ? 0.05.sw : 0.15.sw,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenPortrait() ? 0.02.sh : 0.04.sh,
            horizontal: screenPortrait() ? 0.05.sw : 0.03.sw,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _cardData.title!,
                style: theme(context).textTheme.headline1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/dashboard/${_cardData.assetName}.png',
                    width: screenPortrait() ? 0.12.sw : 0.06.sw,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    _endpointValue(),
                    style: theme(context).textTheme.bodyText1!.copyWith(
                          color: _cardData.color,
                        ),
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
