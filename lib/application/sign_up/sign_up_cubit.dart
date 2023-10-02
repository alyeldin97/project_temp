import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_template/application/login/sign_in_cubit.dart';
import 'package:project_template/domain/models/user.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/repos/sign_up/sign_up_repo.dart';
import '../../helpers/failures.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpRepo signUpRepo;

  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);

  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();

  String phoneNumber = '';
  String email = '';

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  void startValidating() {
    autoValidateMode = AutovalidateMode.always;
    emit(SignUpStartValidating());
  }

  void signUp(String countryCode, context) async {
    emit(SignUpWithEmailAndPasswordLoading());
    // log(mobileNumberController.text);
    print(countryCode);
    Either<Failure, UserModel> customerOrFailure = await signUpRepo.signUp(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        mobileNumber: countryCode + mobileNumberController.text,
        lastName: lastNameController.text);

    customerOrFailure.fold(
        (failure) => emit(SignUpWithEmailAndPasswordFailure(failure: failure)),
        (customer) {
      phoneNumber = customer.phone;
      email = customer.email;
      emit(SignUpWithEmailAndPasswordSuccess());
      BlocProvider.of<SignInCubit>(context).signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
          fromSignUp: true);
      _clearFormFields();
    });
  }

  void _clearFormFields() {
    emailController.clear();
    firstNameController.clear();
    passwordController.clear();
    lastNameController.clear();
    mobileNumberController.clear();
    emit(SignUpResetState());
  }

  @override
  Future<void> close() {
    lastNameController.dispose();
    emailController.dispose();
    mobileNumberController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    return super.close();
  }
}
