import 'package:flutter/material.dart';

class AppNavigator {
  static void navigateToRoute(String routeName, context, {arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void navigateToRouteReplacement(String routeName, context, {args}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: args);
  }

  static void navigateToScreen(Widget screen, context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static void navigateToScreenReplacement(Widget screen, context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static void navigateReplaceAll(Widget screen, context) {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => screen), (route) => false);
  }

  static void navigateToRouteAndRemoveUntil(String routeName, context) {
    Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
  }
}
