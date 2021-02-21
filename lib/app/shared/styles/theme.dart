import 'package:flutter/material.dart';

ThemeData themeData() => ThemeData(
      appBarTheme: appBarThemeScheme(),
      floatingActionButtonTheme: floatingActionButtonThemeDataScheme(),
      scaffoldBackgroundColor: Colors.white,
      buttonColor: Colors.white,
      splashColor: Colors.blueAccent.withOpacity(0.6),
      hoverColor: Colors.white.withOpacity(0.6),
    );

AppBarTheme appBarThemeScheme() => AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );

FloatingActionButtonThemeData floatingActionButtonThemeDataScheme() =>
    FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.amber.withOpacity(0.6),
      hoverColor: Colors.amber.withOpacity(0.6),
      splashColor: Colors.grey.withOpacity(0.4),
    );
