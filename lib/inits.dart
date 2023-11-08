import 'dart:developer';

import 'package:project_template/domain/models/user.dart';
import 'package:project_template/helpers/app_global_data.dart';
// import 'package:device_info_plus/device_info_plus.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project_template/helpers/hive_helper.dart';
import 'dart:io' show Platform;

import 'configs/constants/hive.dart';

class Inits {
  static Future initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    await LocalStorageService(HiveConstants.onboarding).openBox();
    await LocalStorageService(HiveConstants.language).openBox();
    await LocalStorageService(HiveConstants.user).openBox();
  }

  static getCachedData() async {
    String cachedLanguage = await LocalStorageService(HiveConstants.language)
            .getWithKey(HiveConstants.language) ??
        '';
    AppGlobalData.LANG = cachedLanguage;

    UserModel? cachedUser = await LocalStorageService(HiveConstants.user)
        .getWithKey(HiveConstants.user);

    AppGlobalData.CURRENT_USER = cachedUser;
  }
}

enum DeviceType {
  iPad,
  default_,
}
