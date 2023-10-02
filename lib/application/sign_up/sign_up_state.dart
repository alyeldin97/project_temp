// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_up_cubit.dart';

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpChangePasswordVisibility extends SignUpState {
  bool isVisibile;
  SignUpChangePasswordVisibility(
    this.isVisibile,
  );
  @override
  List<Object> get props => [isVisibile];
}

class SignUpChangeValidationInput extends SignUpState {
  String validationInput;
  SignUpChangeValidationInput(
    this.validationInput,
  );
  @override
  List<Object> get props => [validationInput];
}

class SignUpResetState extends SignUpState {}

class SignUpStartValidating extends SignUpState {}

class SignUpWithEmailAndPasswordLoading extends SignUpState {}

class SignUpWithEmailAndPasswordSuccess extends SignUpState {}

class SignUpWithEmailAndPasswordFailure extends SignUpState {
  Failure failure;
  SignUpWithEmailAndPasswordFailure({
    required this.failure,
  });
}

