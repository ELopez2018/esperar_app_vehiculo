import 'package:flutter/material.dart';

const primaryColor = Color(0xFFf40d53);

Color getColor(String color) {
  if (color.contains('#')) {
    return Color(int.parse(color.split('#')[1], radix: 16) + 0xFF000000);
  } else {
    return Color(int.parse(color, radix: 16) + 0xFF000000);
  }
}
