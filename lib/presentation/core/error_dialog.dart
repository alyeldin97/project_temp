import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_template/presentation/core/reusable_widgets/buttons.dart';

import '../utils/colors.dart';
import '../utils/error_screen_handler.dart';
import '../utils/localizations.dart';
import '../utils/textstyles.dart';

class ErrorDialogue extends StatelessWidget {
  final String messageEn;
  final String messageAr;
  final String? buttonText;
  final bool isInternetError;

  final Screens screen;
  final dynamic? arguments;
  const ErrorDialogue(
      {Key? key,
      required this.messageEn,
      required this.messageAr,
      required this.screen,
      required this.isInternetError,
      this.buttonText,
      this.arguments});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.r))),
        content: SizedBox(
          height: 300.h,
          width: 300.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                isInternetError ? Icons.wifi_off : Icons.close_rounded,
                size: 75.w,
                color: AppColors.secondaryColor,
              ),
              PrimaryTextMedium(
                  text: isInternetError
                      ? AppLocalizations.of(context)!.internetError + "!"
                      : AppLocalizations.of(context)!.error + "!",
                  fontSize: 20),
              PrimaryTextLight(
                  text: LocaleHelper.isEnglish(context) ? messageEn : messageAr,
                  fontSize: 12),
              AppButton(
                text: buttonText ?? AppLocalizations.of(context)!.tryAgain,
                onPressed:
                    handleErrorScreen(context, screen, arguments: arguments),
                width: 150,
                color: AppColors.backGroundColor,
                isFilled: false,
              ),
            ],
          ),
        ));
  }
}

enum Screens {
  splash,
  login,
  register,
  home,
  subOrderPermission,
  orderEmptyOrderCachingError,
  homeAds,
  payment,
  category
}
