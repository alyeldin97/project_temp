import 'package:project_template/application/onboarding/onboarding_cubit.dart';
import 'package:project_template/presentation/screens/onboarding/widgets/first_onboarding_fragement.dart';
import 'package:project_template/presentation/screens/onboarding/widgets/page_indicator.dart';
import 'package:project_template/presentation/screens/onboarding/widgets/second_onboarding_fragement.dart';
import 'package:project_template/presentation/screens/onboarding/widgets/third_onboarding_fragement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingCubit onBoardingCubit = BlocProvider.of<OnboardingCubit>(context);

    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backGroundColor,
          body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            PageView(
              controller: onBoardingCubit.onboardingPageController,
              physics: const BouncingScrollPhysics(),
              // controller: onBoardingPageController,
              onPageChanged: (currentPage) async {
                changeImage(currentPage, onBoardingCubit, context);
              },
              clipBehavior: Clip.antiAliasWithSaveLayer,
              children: [
                FirstOnBoardingFragment(),
                SecondOnboardingFragement(),
                ThirdOnBoardingFragment(),
              ],
            ),
            OnboardingPageIndicator(),
          ]),
        );
      },
    );
  }

  void changeImage(index, onboardingCubit, context) {
    onboardingCubit.changeOnBoardingImage(index);
  }
}
