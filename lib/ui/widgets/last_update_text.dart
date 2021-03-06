import 'package:covid_19_tracker/utils/localizations.dart';
import 'package:covid_19_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class LastUpdateText extends StatelessWidget {
  const LastUpdateText({
    required this.lastUpdateText,
  });

  final DateTime? lastUpdateText;

  @override
  Widget build(BuildContext context) {
    String _lastUpdatedText() {
      if (lastUpdateText != null) {
        final DateFormat formatter = DateFormat('d MMM yyyy').add_Hms();
        final String date = formatter.format(lastUpdateText!);
        return '${translate(context, AppText.lastUpdated)} $date';
      }
      return '';
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenPortrait() ? 0.005.sh : 0.01.sh,
      ),
      child: Text(
        _lastUpdatedText(),
        textAlign: TextAlign.center,
        style: theme(context).textTheme.bodyText2,
      ),
    );
  }
}
