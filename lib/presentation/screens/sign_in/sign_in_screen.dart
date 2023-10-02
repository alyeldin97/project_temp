import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import 'package:project_template/application/login/sign_in_cubit.dart';
import 'package:project_template/presentation/core/reusable_widgets/buttons.dart';
import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
import 'package:project_template/presentation/core/reusable_widgets/reusable_widgets.dart';
import 'package:project_template/presentation/utils/app_error_helper.dart';
import 'package:project_template/presentation/utils/colors.dart';
import 'package:project_template/presentation/utils/textstyles.dart';
import 'package:project_template/presentation/utils/validators.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../core/reusable_widgets/loading.dart';
import '../../utils/navigators.dart';
import '../../utils/routes.dart';

class SignInScreen extends StatelessWidget {
  late SignInCubit signInCubit;
  late bool isLoading;
  late bool isFormValid;

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInWithEmailAndPasswordSuccess) {
          navigateToHomeScreen(context);
        } else if (state is SignInWithEmailAndPasswordFailure) {
          AppErrorHelper.showErrorPopUp(
            state,
            context,
          );
        }
      },
      builder: (context, state) {
        signInCubit = BlocProvider.of<SignInCubit>(context);
        isLoading = state is SignInWithEmailAndPasswordLoading;
        isFormValid =
            signInCubit.signInWithEmailAndPasswordFormKey.currentState !=
                    null &&
                signInCubit.signInWithEmailAndPasswordFormKey.currentState!
                    .validate();
        return AppScaffold(
          resizeToAvoidBottomInset: true,
          title: AppLocalizations.of(context)!.login,
          // "Login",
          body: Form(
            key: signInCubit.signInWithEmailAndPasswordFormKey,
            autovalidateMode: signInCubit.autoValidateMode,
            child: SingleChildScrollView(
              child: AppColumn(
                start: 20,
                end: 20,
                children: [
                  const HeightBox(70),
                  AppFormField(
                    // keyboardType: TextInputType.phone,
                    text: 'email',
                    hintext: AppLocalizations.of(context)!.emailAddress,
                    controller: signInCubit.emailController,
                    validator: AppValidators.validateEmail,
                    icon: const Icon(
                      Icons.email_outlined,
                      color: AppColors.black,
                    ),
                    // isValid: false,
                  ),
                  AppFormField(
                    text: 'Password',
                    hintext: AppLocalizations.of(context)!.typeYourPasswordHere,
                    controller: signInCubit.passwordController,
                    isPassword: true,
                    validator: AppValidators.validatePassword,
                    icon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.black,
                    ),
                  ),
                  const HeightBox(20),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: AppContainer(
                      onPressed: () {
                        navigateToForgotPasswordScreen(context);
                      },
                      child: PrimaryTextSemiBold(
                        text: AppLocalizations.of(context)!.forgetPassword,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const HeightBox(45),
                  Row(
                    children: [
                      SizedBox(
                          width: 18.w,
                          height: 18.h,
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: AppColors.secondaryColor,
                            ),
                            child: Checkbox(
                              value: signInCubit.rememberMe,
                              fillColor: MaterialStateProperty.all<Color>(
                                  AppColors.mainColor),
                              activeColor: AppColors.secondaryColor,
                              onChanged: (isChecked) {
                                signInCubit.setRememberMe(isChecked);
                              },
                            ),
                          )),
                      const WidthBox(10),
                      SecondaryTextRegular(
                          text: AppLocalizations.of(context)!.rememberMe,
                          fontSize: 14),
                    ],
                  ),
                  const HeightBox(55),
                  isLoading
                      ? const LoadingWidget()
                      : AppButton(
                          isFilled: true,
                          width: 335,
                          color: isFormValid
                              ? AppColors.mainColor
                              : AppColors.secondaryColor,
                          text: AppLocalizations.of(context)!.login,
                          hasShadow: true,
                          onPressed: () {
                            signInWithEmailAndPasswordButtonFunction(
                                signInCubit, isFormValid);
                          }),
                  const HeightBox(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryTextLight(
                          text: AppLocalizations.of(context)!.newUser,
                          fontSize: 12),
                      TextButton(
                          onPressed: () {
                            AppNavigator.navigateToRouteReplacement(
                                Routes.signUp, context);
                          },
                          child: PrimaryTextBold(
                            text: AppLocalizations.of(context)!.signUp,
                            fontSize: 12,
                            color: AppColors.mainColor,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const AppSeparator(
                        width: 108,
                        color: AppColors.black,
                      ),
                      PrimaryTextRegular(
                          text: AppLocalizations.of(context)!.or, fontSize: 12),
                      const AppSeparator(
                        width: 108,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                  const HeightBox(30),
                  SocialLoginButton(
                    text: AppLocalizations.of(context)!.signInWithGoogle,
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {},
                    imageWidth: 20,
                    width: double.infinity,
                    height: 38.h,
                  ),
                  const HeightBox(20),
                  SocialLoginButton(
                    text: AppLocalizations.of(context)!.signInWithFacebook,
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {},
                    width: double.infinity,
                    imageWidth: 20,
                    height: 38.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void navigateToHomeScreen(context) {}

  void navigateToSignUpScreen(context) {
    AppNavigator.navigateToRoute(Routes.signUp, context);
  }

  void navigateToForgotPasswordScreen(context) {
    AppNavigator.navigateToRoute(Routes.forgotPassword, context);
  }

  void signInWithEmailAndPasswordButtonFunction(
      SignInCubit signInCubit, isFormValid) {
    if (isFormValid) {
      signInCubit.signInWithEmailAndPassword();
    } else {
      signInCubit.startValidating();
    }
  }
}
