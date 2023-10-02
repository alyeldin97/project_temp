// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

import '../domain/models/user.dart';

class AppGlobalData {
  static UserModel? _CURRENT_USER;
  static String? _LANG;
  static String? _REFRESH_TOKEN;
  static String? _ACCESS_TOKEN;

  static UserModel? get CURRENT_USER {
    return _CURRENT_USER;
  }

  static set CURRENT_USER(UserModel? user) {
    _CURRENT_USER = user;
  }

  static String? get LANG {
    return _LANG;
  }

  static set LANG(String? lang) {
    _LANG = lang;
  }

  static String? get REFRESH_TOKEN {
    return _REFRESH_TOKEN;
  }

  static set REFRESH_TOKEN(String? token) {
    _REFRESH_TOKEN = token;
  }

  static String? get ACCESS_TOKEN {
    return _ACCESS_TOKEN;
  }

  static set ACCESS_TOKEN(String? token) {
    _ACCESS_TOKEN = token;
  }
}
