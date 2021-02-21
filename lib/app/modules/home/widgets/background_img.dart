import 'package:flutter/material.dart';

List<String> backgrounds = [
  'assets/morning.jpg',
  'assets/night_c2.jpg',
  'assets/morning2.jpg',
];

backgroundImg(BoxConstraints constraints, int index) => Container(
      margin: EdgeInsets.only(
        right: 10,
        top: 40,
        bottom: 20,
      ),
      height: constraints.maxHeight,
      width: constraints.maxWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(
            (DateTime.now().hour >= 0 && DateTime.now().hour < 6) ||
                    (DateTime.now().hour >= 18 && DateTime.now().hour < 23)
                ? backgrounds[1]
                : (DateTime.now().hour > 12 && DateTime.now().hour < 18)
                    ? backgrounds[2]
                    : backgrounds[0],
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
