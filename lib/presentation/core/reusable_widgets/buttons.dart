import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
import 'package:project_template/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/textstyles.dart';

class AppButton extends StatelessWidget {
  final bool isFilled;
  final double width;
  final double height;
  final double? borderThickness;
  final bool hasShadow;
  final double textSize;
  final Color? color;
  final Color secondaryColor;
  Color? borderColor;
  Color textColor;
  final String text;
  final Function()? onPressed;

  AppButton(
      {super.key,
      this.isFilled = true,
      this.width = double.infinity,
      required this.color,
      required this.text,
      this.onPressed,
      this.hasShadow = false,
      this.borderColor,
      this.borderThickness = 5,
      this.textColor = AppColors.white,
      this.secondaryColor = AppColors.backGroundColor,
      this.height = 53.0,
      this.textSize = 16});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        elevation: 3.w,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.r),
            border: borderColor == null
                ? null
                : Border.all(color: borderColor!, width: borderThickness!.w),
          ),
          child: Center(
            child: PrimaryTextSemiBold(
              text: text,
              fontSize: textSize,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}

class AppButtonWithIcon extends StatelessWidget {
  final bool isFilled;
  final double width;
  final double height;
  final double textSize;
  final Color color;
  final Color secondaryColor;
  Color? borderColor;
  final String text;
  final Function() onPressed;
  final Widget icon;

  AppButtonWithIcon(
      {super.key,
      required this.isFilled,
      required this.width,
      required this.color,
      required this.text,
      required this.icon,
      required this.onPressed,
      this.borderColor,
      this.secondaryColor = AppColors.backGroundColor,
      this.height = 50.0,
      this.textSize = 17});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? color),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(Icons.location)
              icon,
              const WidthBox(15),
              PrimaryTextRegular(
                text: text,
                fontSize: textSize,
                color: secondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double textSize;
  final bool isSelected;
  final String text;
  final String description;
  final Widget icon;
  final bool isCenter;
  final Function() onPressed;

  AppChoiceButton(
      {super.key,
      required this.width,
      required this.text,
      required this.onPressed,
      required this.isSelected,
      this.icon = const SizedBox(),
      this.height = 50.0,
      this.isCenter = true,
      this.textSize = 14,
      this.description = ''});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          border: Border.all(
              color:
                  isSelected ? AppColors.secondaryColor : AppColors.mainColor),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          mainAxisAlignment: icon is SizedBox
              ? MainAxisAlignment.center
              : MainAxisAlignment.start, // : MainAxisAlignment.start,
          children: [
            icon is Icon ? Container() : Spacer(),
            PaddingDynamic(top: 10, child: icon),
            PaddingDynamic(
              start: 4,
              bottom: isCenter ? 0 : 6,
              child: Column(
                crossAxisAlignment: isCenter
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isCenter ? Container() : const Spacer(),
                  PrimaryTextRegular(
                    text: text,
                    fontSize: textSize,
                    isCenter: true,
                    color: isSelected
                        ? AppColors.secondaryColor
                        : AppColors.mainColor,
                  ),
                  const HeightBox(1),
                  if (description != '')
                    PrimaryTextRegular(
                      isCenter: true,
                      text: description,
                      fontSize: textSize - 4,
                      color: isSelected
                          ? AppColors.secondaryColor
                          : AppColors.mainColor,
                    ),
                ],
              ),
            ),
            Spacer(),
            Container(
                alignment: AlignmentDirectional.topEnd,
                child: isSelected
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.mainColor,
                        size: 20.r,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        color: AppColors.secondaryColor,
                        size: 20.r,
                      )),
          ],
        ),
      ),
    );
  }
}

class AppButtonWithPrice extends StatelessWidget {
  final bool isFilled;
  final double width;
  final double height;
  final double textSize;
  final Color color;
  final Color secondaryColor;
  Color? borderColor;
  final String text;
  final String price;
  final Function() onPressed;

  AppButtonWithPrice(
      {super.key,
      required this.isFilled,
      required this.width,
      required this.color,
      required this.text,
      required this.onPressed,
      required this.price,
      this.borderColor,
      this.secondaryColor = AppColors.backGroundColor,
      this.height = 50.0,
      this.textSize = 17});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? color),
          borderRadius: BorderRadius.circular(7.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text.rich(
              TextSpan(children: [
                TextSpan(
                    text: 'KD',
                    style: primaryFontRegularTextStyle(12,
                        color: AppColors.mainColor)),
                TextSpan(
                    text: ' $price',
                    style: primaryFontRegularTextStyle(16,
                        color: AppColors.mainColor))
              ]),
            ),
            Container(
              width: 2.w,
              height: 13.h,
              color: AppColors.mainColor,
            ),
            PrimaryTextRegular(
              text: text,
              fontSize: textSize,
              color: secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
