import 'package:flutter/material.dart';

pressure_humidity(AsyncSnapshot<dynamic> snapshot) => Row(
      children: [
        Expanded(
          child: ListTile(
            minLeadingWidth: 14,
            leading: Icon(Icons.device_thermostat),
            title: Text('${snapshot.data['pressure']} kPa'),
          ),
        ),
        Expanded(
          child: ListTile(
            minLeadingWidth: 14,
            leading: Icon(Icons.wb_cloudy),
            title: Text('${snapshot.data['humidity']} lb/ft³'),
          ),
        ),
      ],
    );
