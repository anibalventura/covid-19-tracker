import 'package:covid_19_app/repositories/data_repository.dart';
import 'package:covid_19_app/screens/dashboard_screen.dart';
import 'package:covid_19_app/services/api.dart';
import 'package:covid_19_app/services/api_services.dart';
import 'package:flutter/material.dart';
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
      child: MaterialApp(
        title: 'COVID-19 Tracker',
        routes: {
          DashboardScreen.route: (context) => DashboardScreen(),
        },
        initialRoute: DashboardScreen.route,
      ),
    );
  }
}
