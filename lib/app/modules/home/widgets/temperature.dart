import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double transformKelvin2Celsius(double temp) {
  double newTemp;
  newTemp = temp - 273.15;
  return newTemp;
}

temperature(AsyncSnapshot<dynamic> snapshot) => Text(
      '${transformKelvin2Celsius(snapshot?.data['temp']).toStringAsPrecision(3)} °C',
      style: TextStyle(
        color: Colors.white,
        fontSize: 50,
        fontWeight: FontWeight.bold,
      ),
    );
