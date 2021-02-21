import 'package:flutter/material.dart';

double transformKelvin2Celsius(double temp) {
  double newTemp;
  newTemp = temp - 273.15;
  return newTemp;
}

min_max_temp(AsyncSnapshot<dynamic> snapshot) => Text(
      '${transformKelvin2Celsius(snapshot?.data['temp-min']).toStringAsPrecision(3)} °C - ${transformKelvin2Celsius(snapshot?.data['temp-max']).toStringAsPrecision(3)} °C',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
