import 'package:covid_19_app/data/model/endpoint_card_model.dart';
import 'package:covid_19_app/services/api/api.dart';
import 'package:covid_19_app/utils/localizations.dart';
import 'package:covid_19_app/utils/utils.dart';
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
    final nf = NumberFormat('###,###');

    final Map<Endpoint, EndpointCardData> _cardsData = {
      Endpoint.cases: EndpointCardData(
        title: translate(context, AppText.cases),
        assetName: AppText.cases,
        color: Colors.yellow,
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
                _cardData.title!,
                style: theme(context).textTheme.headline1,
              ),
              SizedBox(height: 0.01.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/${_cardData.assetName}.png',
                    width: 0.12.sw,
                    fit: BoxFit.fill,
                  ),
                  Text(
                    nf.format(value),
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
