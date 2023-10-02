import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static const Color mainColor = const Color(0xffEA0033);

  static  MaterialColor mainColorMaterial = createMaterialColor(Color(0xffEA0033));
  static const Color secondaryColor = const Color(0xffC7C7C7);

  static const Color error = const Color(0xffFF0000);
  static const Color green = const Color(0xff319F43);

  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const Color backGroundColor = Colors.white;
  static const Color lightGrey = Color(0xffF3F3F3);
  static const Color d9d9Grey = Color(0xffD9D9D9);
  static const Color ebebGrey = Color(0xffEBEBEB);

}


MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }

  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }

  return MaterialColor(color.value, swatch);
}
