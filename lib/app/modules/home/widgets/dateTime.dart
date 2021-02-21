import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

dateTime() => Text(
      DateFormat('d MMMM y').format(DateTime.now()).toString(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontWeight: FontWeight.w500,
      ),
    );
