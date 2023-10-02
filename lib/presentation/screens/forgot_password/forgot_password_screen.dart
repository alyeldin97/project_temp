import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/application/login/sign_in_cubit.dart';
import 'package:project_template/presentation/core/reusable_widgets/buttons.dart';
import 'package:project_template/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:project_template/presentation/utils/app_error_helper.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/textstyles.dart';
import 'package:project_template/presentation/utils/validators.dart';
import '../../core/reusable_widgets/loading.dart';
import '../../utils/navigators.dart';
import '../../utils/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPasswordScreen extends StatelessWidget {
  late bool isLoading;
  late bool isFormValid;

  ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInWithEmailAndPasswordSuccess) {
        } else if (state is SignInWithEmailAndPasswordFailure) {
          AppErrorHelper.showErrorPopUp(
            state,
            context,
          );
        }
      },
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          isLoading = state is SignInWithEmailAndPasswordLoading;
          isFormValid = false;
          // signInCubit.signInWithEmailAndPasswordFormKey.currentState !=
          //         null &&
          //     signInCubit.signInWithEmailAndPasswordFormKey.currentState!
          //         .validate();
          return AppScaffold(
            hasBackButton: true,
            resizeToAvoidBottomInset: true,
            title: AppLocalizations.of(context)!.forgetPassword,
            body: Form(
              // key: signInCubit.signInWithEmailAndPasswordFormKey,
              // autovalidateMode: signInCubit.autovalidateMode,
              child: SingleChildScrollView(
                child: AppColumn(
                  start: 20,
                  end: 20,
                  children: [
                    const HeightBox(115),
                    PrimaryTextMedium(
                      start: 50,
                      end: 50,
                      text: AppLocalizations.of(context)!.pleaseTypeNewPassword,
                      fontSize: 14,
                      isCenter: true,
                      color: AppColors.secondaryColor,
                    ),
                    const HeightBox(50),
                    AppFormField(
                      text: 'Password',
                      hintext:
                          AppLocalizations.of(context)!.typeYourPasswordHere,
                      controller: TextEditingController(),
                      validator: AppValidators.validatePhoneNumber,
                      icon: const Icon(
                        Icons.phone_outlined,
                        color: AppColors.black,
                      ),
                    ),
                    const HeightBox(110),
                    isLoading
                        ? LoadingWidget()
                        : AppButton(
                            isFilled: true,
                            width: 335,
                            color: isFormValid
                                ? AppColors.mainColor
                                : AppColors.secondaryColor,
                            text: AppLocalizations.of(context)!.next,
                            hasShadow: true,
                            onPressed: () {
                              navigateToHomeScreen(context);
                            }),
                    const HeightBox(15),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void navigateToHomeScreen(context) {}
