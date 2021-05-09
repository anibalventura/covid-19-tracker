import 'package:covid_19_app/data/repository/data_repository.dart';
import 'package:covid_19_app/screens/dashboard_screen.dart';
import 'package:covid_19_app/services/api/api.dart';
import 'package:covid_19_app/services/api/api_services.dart';
import 'package:covid_19_app/utils/localizations.dart';
import 'package:covid_19_app/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Covid19App());
}

class Covid19App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataRepository>(
          create: (context) => DataRepository(
            apiService: APIService(API.sandbox()),
          ),
        )
      ],
      child: ScreenUtilInit(
        builder: () => MaterialApp(
          title: 'COVID-19 Tracker',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('es', ''),
          ],
          localeResolutionCallback:
              (Locale? locale, Iterable<Locale> supportedLocales) {
            for (final Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale!.languageCode ||
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          routes: {
            DashboardScreen.route: (context) => DashboardScreen(),
          },
          initialRoute: DashboardScreen.route,
        ),
      ),
    );
  }
}
