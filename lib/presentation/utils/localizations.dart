import 'package:flutter/material.dart';

class LocaleHelper {
  static bool isEnglish(context) {
    return Localizations.localeOf(context).toString() == 'en';
  }

  static String getCurrentLocale(context) {
    return Localizations.localeOf(context).toString();
  }
}
