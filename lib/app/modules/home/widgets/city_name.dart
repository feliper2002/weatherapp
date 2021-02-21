import 'package:flutter/material.dart';

cityName(AsyncSnapshot<dynamic> snapshot) => Align(
      alignment: Alignment.topCenter,
      child: Text(
        snapshot.data['name'],
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
