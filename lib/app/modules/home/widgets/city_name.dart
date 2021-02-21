import 'package:flutter/material.dart';

cityName(AsyncSnapshot<dynamic> snapshot) => Align(
      alignment: Alignment.topCenter,
      child: Text(
        '${snapshot.data['name']}, ${snapshot.data['country']}',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
