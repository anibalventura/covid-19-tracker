import 'package:covid_19_tracker/utils/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme(BuildContext context) => Theme.of(context);

String translate(BuildContext context, String text) =>
    AppLocalizations.of(context)!.trans(text)!;

bool screenPortrait() =>
    ScreenUtil().orientation == Orientation.portrait ? true : false;
