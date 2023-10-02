import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_template/configs/constants/images.dart';
import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
import 'package:project_template/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/localizations.dart';
import 'package:project_template/presentation/utils/navigators.dart';
import 'package:project_template/presentation/utils/routes.dart';
import 'package:project_template/presentation/utils/textstyles.dart';

import '../../../../application/global/global_cubit.dart';
import '../../../core/reusable_widgets/buttons.dart';

class LanguagePickerFragement extends StatefulWidget {
  LanguagePickerFragement({super.key});

  @override
  State<LanguagePickerFragement> createState() =>
      _LanguagePickerFragementState();
}

class _LanguagePickerFragementState extends State<LanguagePickerFragement> {
  late GlobalCubit globalCubit;
  bool hasSelected = false;

  @override
  Widget build(BuildContext context) {
    globalCubit = BlocProvider.of<GlobalCubit>(context);
    return Scaffold(
      body: PaddingHorizontal(
        value: 16,
        child: Column(
          children: [
            const HeightBox(300),
            // Image.asset(AssetImagesPaths.logo),
            PrimaryTextSemiBold(text: 'Select Language', fontSize: 20),
            const HeightBox(36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  color: AppColors.secondaryColor,
                  text: 'English',
                  borderColor: LocaleHelper.isEnglish(context) && hasSelected
                      ? AppColors.mainColor
                      : null,
                  borderThickness: 4,
                  width: 166,
                  height: 90,
                  onPressed: () {
                    setState(() {
                      hasSelected = true;
                    });
                    globalCubit.changeLanguage('en');
                  },
                ),
                Spacer(),
                AppButton(
                  color: AppColors.secondaryColor,
                  text: 'العربية',
                  width: 166,
                  borderColor: !LocaleHelper.isEnglish(context) && hasSelected
                      ? AppColors.mainColor
                      : null,
                  height: 90,
                  onPressed: () {
                    setState(() {
                      hasSelected = true;
                    });
                    globalCubit.changeLanguage('ar');
                  },
                ),
              ],
            ),
            const HeightBox(217),
            AppButton(
                onPressed: hasSelected
                    ? () {
                        AppNavigator.navigateToRouteAndRemoveUntil(
                            Routes.onboarding, context);
                      }
                    : () {},
                color: hasSelected
                    ? AppColors.mainColor
                    : AppColors.secondaryColor,
                text: 'Continue'),
          ],
        ),
      ),
    );
  }
}
