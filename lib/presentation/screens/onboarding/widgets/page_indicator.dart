import 'package:project_template/application/onboarding/onboarding_cubit.dart';
import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
import 'package:project_template/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/routes.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/navigators.dart';
import 'dart:ui' as ui;

class OnboardingPageIndicator extends StatelessWidget {
  const OnboardingPageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingCubit onboardingCubit = BlocProvider.of<OnboardingCubit>(context);
    return Stack(
      children: [
        // PaddingDynamic(
        //   top: 685,
        //   end: 275,
        //   child: ImageFiltered(
        //     imageFilter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        //     child: Center(
        //       child: Icon(
        //         Icons.arrow_back_ios,
        //         color: AppColors.black.withOpacity(0.4),
        //       ),
        //     ),
        //   ),
        // ),
        PaddingDynamic(
          top: 728,
          start: 40,
          child: InkWell(
            onTap: () {
              if (onboardingCubit.currentIndex != 0) {
                changeImage(
                    --onboardingCubit.currentIndex, onboardingCubit, context);
              }
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.black,
            ),
          ),
        ),
        PaddingDynamic(
          start: 112 - 27.5,
          top: 730,
          child: Stack(
            children: [
              // PaddingDynamic(
              //   start: 30,
              //   bottom: 70,
              //   child: Row(
              //     children: [
              //       Material(
              //         elevation: 10.w,
              //         color: Colors.transparent,
              //         child: CircleAvatar(
              //           backgroundColor: Colors.transparent,
              //           radius: 5.r,
              //         ),
              //       ),
              //       const WidthBox(60),
              //       Material(
              //         elevation: 10.w,
              //         color: Colors.transparent,
              //         child: CircleAvatar(
              //           backgroundColor: Colors.transparent,
              //           radius: 5.r,
              //         ),
              //       ),
              //       const WidthBox(60),
              //       Material(
              //         elevation: 10.w,
              //         color: Colors.transparent,
              //         child: CircleAvatar(
              //           backgroundColor: Colors.transparent,
              //           radius: 5.r,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              DotsIndicator(
                dotsCount: 3,
                position: onboardingCubit.currentIndex.toDouble(),
                decorator: DotsDecorator(
                    size: Size.square(13.5.w),
                    activeSize: Size.square(13.5.w),
                    color: AppColors.secondaryColor,
                    activeColor: AppColors.mainColor,
                    spacing: EdgeInsets.symmetric(horizontal: 27.75.w)),
                onTap: (index) {
                  onboardingCubit.changeOnBoardingImage(index.toInt());
                  onboardingCubit.onboardingPageController.animateToPage(
                      index.toInt(),
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
                },
              ),
            ],
          ),
        ),
        PaddingDynamic(
          top: 685,
          start: 280,
          child: ImageFiltered(
            imageFilter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Center(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.transparent,
              ),
            ),
          ),
        ),
        PaddingDynamic(
          top: 728,
          start: 315,
          child: InkWell(
            onTap: () {
              if (onboardingCubit.currentIndex != 2) {
                changeImage(
                    ++onboardingCubit.currentIndex, onboardingCubit, context);
              } else {
                navigateToSignInScreen(context, onboardingCubit);
              }
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: AppColors.black,
            ),
          ),
        ),
      ],
    );
  }

  void navigateToSignInScreen(context, onboardingCubit) {
    onboardingCubit.cacheOnboarding();

    AppNavigator.navigateToRouteAndRemoveUntil(Routes.signIn, context);
  }

  void changeImage(index, OnboardingCubit onboardingCubit, context) {
    onboardingCubit.onboardingPageController.animateToPage(index.toInt(),
        duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    onboardingCubit.changeOnBoardingImage(index);
  }
}
