// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInStartValidating extends SignInState {}

class SignInChangePasswordVisibility extends SignInState {
  bool isVisible;
  SignInChangePasswordVisibility(
    this.isVisible,
  );
  @override
  List<Object> get props => [isVisible];
}

class SignInToggleRememberMe extends SignInState {
  bool rememberMe;
  SignInToggleRememberMe(
    this.rememberMe,
  );
  @override
  List<Object> get props => [rememberMe];
}

class SignInWithEmailAndPasswordLoading extends SignInState {}

class SignInWithEmailAndPasswordSuccess extends SignInState {}

class SignInWithEmailAndPasswordFailure extends SignInState {
  Failure failure;
  SignInWithEmailAndPasswordFailure({
    required this.failure,
  });
}

class SignInWithOtpLoading extends SignInState {}

class SignInWithOtpSuccess extends SignInState {}

class SignInWithOtpFailure extends SignInState {
  Failure failure;
  SignInWithOtpFailure({
    required this.failure,
  });
}

class SendOtpLoading extends SignInState {}

class SendOtpSuccess extends SignInState {}

class SendOtpFailure extends SignInState {
  Failure failure;
  SendOtpFailure({
    required this.failure,
  });
}
