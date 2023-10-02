import 'package:project_template/presentation/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../configs/constants/fonts.dart';

class PrimaryTextRegular extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final bool italic;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const PrimaryTextRegular(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines,
      this.italic = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: end!.w,
        top: top!.h,
        start: start!.w,
        bottom: bottom!.h,
      ),
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: isCenter! ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          shadows: hasShadow
              ? [
                  Shadow(
                    offset: Offset(1.w, 4.h),
                    blurRadius: 3.0.r,
                    color: color.withOpacity(0.3),
                  ),
                ]
              : null,
          fontFamily: FontsConstants.primaryFont,
          fontSize: fontSize.sp,
          fontWeight: FontWeighConstants.regular,
          color: color ?? AppColors.secondaryColor,
          fontStyle: italic ? FontStyle.italic : null,
          decoration:
              isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}

TextStyle primaryFontRegularTextStyle(double fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.regular,
      color: color ?? AppColors.mainColor);
}

class PrimaryTextLight extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const PrimaryTextLight(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        end: end!.w,
        top: top!.h,
        start: start!.w,
        bottom: bottom!.h,
      ),
      child: Text(
        text,
        maxLines: maxLines,
        textAlign: isCenter! ? TextAlign.center : TextAlign.start,
        style: TextStyle(
          shadows: hasShadow
              ? [
                  Shadow(
                    offset: Offset(1.w, 4.h),
                    blurRadius: 3.0.r,
                    color: color.withOpacity(0.3),
                  ),
                ]
              : null,
          fontFamily: FontsConstants.primaryFont,
          fontSize: fontSize.sp,
          fontWeight: FontWeighConstants.light,
          color: color ?? AppColors.mainColor,
          decoration:
              isLineThrough! ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}

TextStyle primaryFontLightTextStyle(double fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.light,
      color: color ?? AppColors.secondaryColor);
}

class PrimaryTextMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const PrimaryTextMedium(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.primaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.medium,
            color: color ?? AppColors.secondaryColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle primaryFontMediumTextStyle(double fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.medium,
      color: color ?? AppColors.mainColor);
}

class PrimaryTextSemiBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;

  const PrimaryTextSemiBold(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.primaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.semiBold,
            color: color,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle primaryFontSemiBoldTextStyle(int fontSize,
    {Color? color, bool isCenter = false}) {
  return TextStyle(
    fontFamily: FontsConstants.primaryFont,
    fontSize: fontSize.sp,
    fontWeight: FontWeighConstants.semiBold,
    color: color ?? AppColors.mainColor,
  );
}

class PrimaryTextBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const PrimaryTextBold(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.primaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.bold,
            color: color ?? AppColors.secondaryColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle primaryFontBoldTextStyle(int fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.primaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.bold,
      color: color ?? AppColors.mainColor);
}

class SecondaryTextRegular extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool isUnderLine;
  final bool? isCenter;
  final bool hasShadow;

  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const SecondaryTextRegular(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      this.isUnderLine = false,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.secondaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.regular,
            color: color ?? AppColors.secondaryColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : isUnderLine
                    ? TextDecoration.underline
                    : TextDecoration.none,
          ),
        ));
  }
}

TextStyle secondaryFontRegularTextStyle(int fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.regular,
      color: color ?? AppColors.mainColor);
}

class SecondaryTextLight extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const SecondaryTextLight(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.secondaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.light,
            color: color ?? AppColors.mainColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle secondaryFontLightTextStyle(int fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.light,
      color: color ?? AppColors.mainColor);
}

class SecondaryTextMedium extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const SecondaryTextMedium(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.secondaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.medium,
            color: color ?? AppColors.mainColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle secondaryFontMediumTextStyle(int fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.medium,
      color: color ?? AppColors.mainColor);
}

class SecondaryTextSemiBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const SecondaryTextSemiBold(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.secondaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.semiBold,
            color: color ?? AppColors.mainColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle secondaryFontSemiBoldTextStyle(int fontSize, {Color? color}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontWeight: FontWeighConstants.semiBold,
      color: color ?? AppColors.mainColor);
}

class SecondaryTextBold extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final bool? isLineThrough;
  final bool? isCenter;
  final bool hasShadow;
  final int? maxLines;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const SecondaryTextBold(
      {Key? key,
      this.top = 0.0,
      this.bottom = 0.0,
      this.end = 0.0,
      this.start = 0.0,
      required this.text,
      this.hasShadow = false,
      required this.fontSize,
      this.color = AppColors.black,
      this.isLineThrough = false,
      this.isCenter = false,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsetsDirectional.only(
          end: end!.w,
          top: top!.h,
          start: start!.w,
          bottom: bottom!.h,
        ),
        child: Text(
          text,
          maxLines: maxLines,
          textAlign: isCenter! ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            shadows: hasShadow
                ? [
                    Shadow(
                      offset: Offset(1.w, 4.h),
                      blurRadius: 3.0.r,
                      color: color.withOpacity(0.3),
                    ),
                  ]
                : null,
            fontFamily: FontsConstants.secondaryFont,
            fontSize: fontSize.sp,
            fontWeight: FontWeighConstants.bold,
            color: color ?? AppColors.mainColor,
            decoration: isLineThrough!
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ));
  }
}

TextStyle secondaryFontBoldTextStyle(int fontSize,
    {Color? color, bool isItalic = false}) {
  return TextStyle(
      fontFamily: FontsConstants.secondaryFont,
      fontSize: fontSize.sp,
      fontStyle: isItalic ? FontStyle.italic : null,
      fontWeight: FontWeighConstants.bold,
      color: color ?? AppColors.mainColor);
}
