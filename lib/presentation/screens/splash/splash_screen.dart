import 'dart:async';
import 'dart:io';
import 'package:project_template/application/global/global_cubit.dart';
import 'package:project_template/configs/constants/hive.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../helpers/app_global_data.dart';
import '../../../helpers/hive_helper.dart';
import '../../utils/navigators.dart';
import '../../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;
  late GlobalCubit globalCubit;
  bool isAlreadyLoggedIn = AppGlobalData.CURRENT_USER != null;

  @override
  void initState() {
    globalCubit = BlocProvider.of<GlobalCubit>(context);

    _getCachedLanguageIfExists();
    timer = Timer(const Duration(milliseconds: 1500), () async {
      navigateToOnboardingOrAuthOrHomeScreen(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void navigateToOnboardingOrAuthOrHomeScreen(context) async {
    bool hasOpennedAppBefore = await HiveHelper(HiveConstants.onboarding)
            .getWithKey(HiveConstants.onboarding) ??
        false;

    if (hasOpennedAppBefore) {
      if (isAlreadyLoggedIn) {
        navigateToLayOutScreen();
      } else {
        // AppNavigator.navigateToRouteReplacement(Routes.layout, context);
        navigateToSignInScreen();
      }
    } else {
      navigateToOnboardingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SecondaryTextBold(
        fontSize: 30,
        color: AppColors.mainColor,
        text: "project_template",
      )),
    );
  }

  void navigateToOnboardingScreen() {
    AppNavigator.navigateToRouteReplacement(Routes.languageSelection, context);
  }

  void navigateToLayOutScreen() {}

  void navigateToSignInScreen() {
    AppNavigator.navigateToRouteAndRemoveUntil(Routes.signIn, context);
  }

  void _getCachedLanguageIfExists() async {
    String cachedLanguage = await globalCubit.getCachedLanguage();

    String appLangage;

    if (cachedLanguage == '') {
      String phoneLanguage = Platform.localeName.substring(0, 2);
      appLangage = phoneLanguage;
    } else {
      appLangage = cachedLanguage;
    }
    globalCubit.changeLanguage(appLangage);
  }
}
