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
    await HiveHelper(HiveConstants.onboarding).openBox();
    await HiveHelper(HiveConstants.language).openBox();
    await HiveHelper(HiveConstants.user).openBox();
  }

  static getCachedData() async {
    String cachedLanguage = await HiveHelper(HiveConstants.language)
            .getWithKey(HiveConstants.language) ??
        '';
    AppGlobalData.LANG = cachedLanguage;

    UserModel? cachedUser =
        await HiveHelper(HiveConstants.user).getWithKey(HiveConstants.user);

    AppGlobalData.CURRENT_USER = cachedUser;
  }
}

enum DeviceType {
  iPad,
  default_,
}
