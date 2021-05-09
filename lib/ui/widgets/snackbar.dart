import 'package:covid_19_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackbar({
  required BuildContext context,
  required String msg,
  String? actionLabel,
  Function? onPressed,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: theme(context).textTheme.headline1!.color,
      duration: Duration(milliseconds: 2500),
      content: Text(
        msg,
        style: TextStyle(
          color: theme(context).cardColor,
          fontSize: 14.sp,
        ),
      ),
      behavior: SnackBarBehavior.floating,
    ),
  );
}
