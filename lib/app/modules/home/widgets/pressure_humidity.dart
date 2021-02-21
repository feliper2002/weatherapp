import 'package:flutter/material.dart';

pressure_humidity(AsyncSnapshot<dynamic> snapshot) => Row(
      children: [
        Expanded(
          child: ListTile(
            minLeadingWidth: 14,
            leading: Icon(
              Icons.device_thermostat,
              color: Colors.white,
            ),
            title: Text(
              '${snapshot.data['pressure']} kPa',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            minLeadingWidth: 14,
            leading: Icon(
              Icons.wb_cloudy,
              color: Colors.white,
            ),
            title: Text(
              '${snapshot.data['humidity']} lb/ft³',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
