import 'package:covid_19_tracker/data/cache/data_cache.dart';
import 'package:covid_19_tracker/data/repository/data_repository.dart';
import 'package:covid_19_tracker/ui/screens/dashboard_screen.dart';
import 'package:covid_19_tracker/services/api/api.dart';
import 'package:covid_19_tracker/services/api/api_services.dart';
import 'package:covid_19_tracker/utils/localizations.dart';
import 'package:covid_19_tracker/utils/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences sharedPref = await SharedPreferences.getInstance();

  runApp(Covid19App(sharedPref: sharedPref));
}

class Covid19App extends StatelessWidget {
  const Covid19App({required this.sharedPref});
  final SharedPreferences sharedPref;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DataRepository>(
          create: (context) => DataRepository(
            apiService: APIService(API.sandbox()),
            dataCache: DataCache(
              sharedPref: sharedPref,
            ),
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
