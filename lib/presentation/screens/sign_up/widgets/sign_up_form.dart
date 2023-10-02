// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:project_template/presentation/core/reusable_widgets/padding.dart';
// import 'package:project_template/presentation/utils/textstyles.dart';
//
// import '../../../../application/sign_up/sign_up_cubit.dart';
// import '../../../../helpers/app_error_presenter.dart';
// import '../../../core/reusable_widgets/buttons.dart';
// import '../../../core/reusable_widgets/loading.dart';
// import '../../../core/reusable_widgets/reusable_widgets.dart';
// import '../../../utils/colors.dart';
// import '../../../utils/navigators.dart';
// import '../../../utils/routes.dart';
// import '../../../utils/validators.dart';
//
// class SignUpForm extends StatelessWidget {
//   late SignUpCubit signUpCubit;
//   late bool isLoading;
//   late bool isFormValid;
//
//   SignUpForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<SignUpCubit, SignUpState>(
//       listener: (context, state) {
//         if (state is SignUpWithEmailAndPasswordSuccess) {
//           // navigateToAccountCreatedSuccessScreen(context);
//
//           // navigateToHomeScreen(context);
//         } else if (state is SignUpWithEmailAndPasswordFailure) {
//           AppErrorHelper.showErrorPopUp(
//             state,
//             context,
//           );
//         }
//       },
//       child: BlocBuilder<SignUpCubit, SignUpState>(
//         builder: (context, state) {
//           signUpCubit = BlocProvider.of<SignUpCubit>(context);
//           isLoading = state is SignUpWithEmailAndPasswordLoading;
//           isFormValid = signUpCubit.formKey.currentState != null &&
//               signUpCubit.formKey.currentState!.validate();
//           return Form(
//             key: signUpCubit.formKey,
//             child: Column(
//               children: [
//                 AppFormField(
//                   text: 'Name',
//                   hintext: 'Type your Name Here',
//                   controller: signUpCubit.firstNameController,
//                   validator: AppValidators.validateName,
//                 ),
//                 AppFormField(
//                   text: 'Email',
//                   hintext: 'Type your Email Here',
//                   controller: signUpCubit.emailController,
//                   validator: AppValidators.validateEmail,
//                 ),
//                 AppFormField(
//                   text: 'Phone Number',
//                   isPhone: true,
//                   contentPadding: EdgeInsetsDirectional.only(start: 60),
//                   hintext: 'Type your Phone Number Here',
//                   controller: signUpCubit.mobileNumberController,
//                   validator: AppValidators.validatePhoneNumber,
//                 ),
//                 AppFormField(
//                   text: 'Password',
//                   hintext: 'Type your Password Here',
//                   controller: signUpCubit.passwordController,
//                   isPassword: true,
//                   validator: AppValidators.validatePassword,
//                 ),
//                 AppFormField(
//                   text: 'Confirm Password',
//                   hintext: 'Please Confirm Password',
//                   isPassword: true,
//                   controller: signUpCubit.lastNameController,
//                   validator: (confirmPassword) {
//                     return AppValidators.validateConfirmPassword(
//                         confirmPassword, signUpCubit.passwordController.text);
//                   },
//                 ),
//                 const HeightBox(10),
//                 isLoading
//                     ? LoadingWidget()
//                     : AppButton(
//                         isFilled: true,
//                         width: 335,
//                         color: isFormValid
//                             ? AppColors.mainColor
//                             : AppColors.secondaryColor,
//                         text: 'Sign Up',
//                         onPressed: () {
//                           signUpButtonFunction(signUpCubit, isFormValid);
//                         }),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   // void navigateToAccountCreatedSuccessScreen(context) {
//   //   AppNavigator.navigateToRouteReplacement(Routes.myAddresses, context);
//   // }
//
//   void signUpButtonFunction(SignUpCubit signUpCubit, isFormValid) {
//     if (isFormValid) {
//       signUpCubit.signUp();
//     } else {
//       signUpCubit.startValidating();
//     }
//   }
//
//   void navigateToHomeScreen(context) {
//     AppNavigator.navigateToRouteReplacement(Routes.layout, context);
//   }
// }
