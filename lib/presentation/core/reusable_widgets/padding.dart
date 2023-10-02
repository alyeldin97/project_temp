import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';

class PaddingHorizontal extends StatelessWidget {
  final Widget child;
  final double value;
  const PaddingHorizontal({Key? key, required this.child, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value.w),
      child: child,
    );
  }
}

class PaddingStart extends StatelessWidget {
  final Widget child;
  final double value;
  const PaddingStart({Key? key, required this.child, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: value.w),
      child: child,
    );
  }
}

class PaddingEnd extends StatelessWidget {
  final Widget child;
  final double value;
  const PaddingEnd({Key? key, required this.child, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: value.w),
      child: child,
    );
  }
}

class PaddingDynamic extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const PaddingDynamic({
    Key? key,
    required this.child,
    this.top = 0.0,
    this.bottom = 0.0,
    this.end = 0.0,
    this.start = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: end!.w,
        top: top!.h,
        start: start!.w,
        bottom: bottom!.h,
      ),
      child: child,
    );
  }
}

class MarginDynamic extends StatelessWidget {
  final Widget child;
  final double? top;
  final double? bottom;
  final double? start;
  final double? end;
  const MarginDynamic({
    Key? key,
    required this.child,
    this.top = 0.0,
    this.bottom = 0.0,
    this.end = 0.0,
    this.start = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        end: end!.w,
        top: top!.h,
        start: start!.w,
        bottom: bottom!.h,
      ),
      child: child,
    );
  }
}

class AppContainer extends StatelessWidget {
  final Widget? child;
  final BoxFit? boxFit;
  final String backGroundImg;
  final double? topMargin;
  final double? bottomMargin;
  final double? startMargin;
  final double? endMargin;
  final double? topPadding;
  final double? bottomPadding;
  final double? startPadding;
  final double? endPadding;
  final double? borderRadius;
  final double? width;
  final double? height;
  final bool isElevated;
  final double xShadow;
  final bool isCircle;
  final double yShadow;
  final Color? color;
  final Color shadowColor;
  final Color? borderColor;
  final void Function()? onPressed;

  const AppContainer({
    Key? key,
    this.child,
    this.boxFit = BoxFit.none,
    this.backGroundImg = "",
    this.onPressed,
    this.topMargin = 0.0,
    this.isElevated = false,
    this.color = AppColors.backGroundColor,
    this.shadowColor = AppColors.secondaryColor,
    this.borderColor,
    this.topPadding = 0.0,
    this.endMargin = 0.0,
    this.endPadding = 0.0,
    this.startMargin = 0.0,
    this.startPadding = 0.0,
    this.bottomMargin = 0.0,
    this.bottomPadding = 0.0,
    this.borderRadius = 0.0,
    this.xShadow = 1.0,
    this.yShadow = 4.0,
    this.isCircle = false,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width?.w,
        height: height?.h,
        decoration: BoxDecoration(
          image: backGroundImg.isEmpty
              ? null
              : DecorationImage(
                  image: AssetImage(
                    backGroundImg,
                  ),
                  fit: boxFit,
                ),
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          boxShadow: !isElevated
              ? []
              : [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    blurRadius: 2.5.w,
                    spreadRadius: -2.0.w,
                    offset: Offset(
                        xShadow.w, yShadow.h), // shadow direction: bottom right
                  )
                ],
          color: color,
          border: borderColor == null ? null : Border.all(color: borderColor!),
          borderRadius: isCircle ? null : BorderRadius.circular(borderRadius!),
        ),
        margin: EdgeInsetsDirectional.only(
          end: endMargin!.w,
          top: topMargin!.h,
          start: startMargin!.w,
          bottom: bottomMargin!.h,
        ),
        padding: EdgeInsetsDirectional.only(
          end: endPadding!.w,
          top: topPadding!.h,
          start: startPadding!.w,
          bottom: bottomPadding!.h,
        ),
        child: child,
      ),
    );
  }
}
