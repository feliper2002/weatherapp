import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weatherapp/app/shared/styles/theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Modular.navigatorKey,
      title: 'Weather App',
      theme: themeData(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
