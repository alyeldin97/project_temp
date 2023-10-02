import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/core/error_dialog.dart';
import '../presentation/utils/textstyles.dart';
import 'failures.dart';

class AppErrorHelper {
  static void showErrorPopUp(state, context) {
    Locale currentLocale = Localizations.localeOf(context);
    FlushbarHelper.createError(
            message: currentLocale.languageCode.toLowerCase() == 'en'
                ? state.failure.messageEn
                : state.failure.messageAr)
        .show(context);
  }

  static void showSuccessPopUp(message, context) {
    FlushbarHelper.createSuccess(message: message).show(context);
  }

  static Widget errorWidget(
      {String dataBeingFetched = '', double? topPadding}) {
    String text1 = 'An error occured';
    String text2 =
        dataBeingFetched == '' ? '' : ' while fetching $dataBeingFetched';
    String text3 = ', Please try again later';
    return Center(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
            top: topPadding == null ? 0.0 : topPadding.h,
            start: 20.w,
            end: 20.w),
        child: PrimaryTextBold(text: text1 + text2 + text3, fontSize: 12),
      ),
    );
  }

  static Widget emptyList(String listName, {padding = true}) {
    return Center(
      child: Padding(
        padding: padding
            ? EdgeInsetsDirectional.only(top: 80.0.h, start: 20.w, end: 20.w)
            : EdgeInsetsDirectional.zero,
        child: PrimaryTextBold(text: 'You have no $listName', fontSize: 12),
      ),
    );
  }

  static showErrorDialogue(Failure failure, context, Screens screen,
      {bool isInternetError = false, arguments}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: ErrorDialogue(
            messageEn: failure.messageEn,
            messageAr: failure.messageAr,
            screen: screen,
            isInternetError: isInternetError,
            arguments: arguments,
          ),
        );
      },
    );
  }
}
