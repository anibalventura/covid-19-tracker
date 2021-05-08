import 'package:covid_19_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Covid19App());
}

class Covid19App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Dashboard',
      home: DashboardScreen(),
      routes: {
        DashboardScreen.route: (context) => DashboardScreen(),
      },
      initialRoute: DashboardScreen.route,
    );
  }
}
