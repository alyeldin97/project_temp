import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/application/onboarding/onboarding_cubit.dart';
import 'package:project_template/configs/constants/images.dart';
import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
import 'package:project_template/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../application/global/global_cubit.dart';

class FirstOnBoardingFragment extends StatelessWidget {
  FirstOnBoardingFragment({super.key});

  late GlobalCubit globalCubit;
  late OnboardingCubit onBoardingCubit;

  @override
  Widget build(BuildContext context) {
    onBoardingCubit = BlocProvider.of<OnboardingCubit>(context);
    globalCubit = BlocProvider.of<GlobalCubit>(context);

    return PaddingDynamic(
      top: MediaQuery.of(context).size.height * .3,
      start: 45,
      end: 45,
      child: Column(
        children: [
          Image.asset(
            AssetImagesPaths.onboarding1,
            height: 300,
            width: 300,
            fit: BoxFit.contain,
          ),
          const HeightBox(33),
          PrimaryTextSemiBold(
            text: AppLocalizations.of(context)!.onlineOrdering,
            fontSize: 20,
            color: AppColors.mainColor,
          ),
          const HeightBox(19),
          PrimaryTextMedium(
            text: AppLocalizations.of(context)!.orderYourProduct,
            color: AppColors.secondaryColor,
            isCenter: true,
            fontSize: 15,
          ),
        ],
      ),
    );
  }
}
