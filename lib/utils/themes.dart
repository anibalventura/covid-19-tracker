import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Themes {
  static final String? _fontFamily = GoogleFonts.roboto().fontFamily;

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  /*
  * Light Theme.
  */

  // Colors.
  static final Color _primaryColorLight = Colors.lightBlue;
  static const Color _lightBackgroundColor = Colors.white;
  static final Color _lightCardColor = Colors.grey.shade100;
  static final Color _lightPrimaryTextColor = Colors.black;

  // Text Styles.
  static final TextStyle _lightHeadline1 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: _lightPrimaryTextColor,
  );

  static final TextStyle _lightBodyText1 = _lightHeadline1.copyWith(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );

  // Icon.
  static final IconThemeData _iconThemeLight = IconThemeData(
    color: _primaryColorLight,
    size: 0.1.sw,
  );

  // Final Theme.
  static final ThemeData lightTheme = ThemeData(
    primaryColor: _primaryColorLight,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: _lightBackgroundColor,
    cardColor: _lightCardColor,
    iconTheme: _iconThemeLight,
    textTheme: TextTheme(
      headline1: _lightHeadline1,
      bodyText1: _lightBodyText1,
    ),
    fontFamily: _fontFamily,
  );

  /*
  * Dark Theme.
  */

  // Colors.
  static final Color _primaryColorDark = Colors.lightBlue.shade700;
  static final Color _darkBackgroundColor = Color(0xFF22252D);
  static final Color _darkCardColor = Color(0xFF292D36);
  static const Color _darkPrimaryTextColor = Colors.white;

  // Text Styles.
  static final TextStyle _darkHeadline1 = _lightHeadline1.copyWith(
    color: _darkPrimaryTextColor,
  );

  static final TextStyle _darkBodyText1 = _lightBodyText1.copyWith(
    color: _darkPrimaryTextColor,
  );

  // Icon.
  static final IconThemeData _iconThemeDark = _iconThemeLight.copyWith(
    color: _primaryColorDark,
  );

  // Final Theme.
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: _primaryColorDark,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: _darkBackgroundColor,
    cardColor: _darkCardColor,
    iconTheme: _iconThemeDark,
    textTheme: TextTheme(
      headline1: _darkHeadline1,
      bodyText1: _darkBodyText1,
    ),
  );
}
