import '../configs/constants/api_messages.dart';
import 'failures.dart';
import 'dart:io';

class NetWorkServiceErrorHandler {
  static Failure convertApiErrorsToFailures(failureMessageFromBackEnd) {
    switch (failureMessageFromBackEnd) {
      case ApiErrorMessages.invalidEmail:
        return AppFailures.invalidEmail;
      case ApiErrorMessages.takenEmail:
        return AppFailures.takenEmail;
      case ApiErrorMessages.thisNumberIsNotRegistered:
        return AppFailures.thisNumberIsNotRegistered;
      case ApiErrorMessages.invalidOtp:
        return AppFailures.invalidOtp;
      default:
        return AppFailures.defaultFailure;
    }
  }

  static convertExceptionsToFailure(exception) {
    if (exception is Exception) {
      if (exception is SocketException) {
        throw AppFailures.socketFailure;
      } else {
        throw AppFailures.defaultFailure;
      }
    } else {
      throw AppFailures.defaultFailure;
    }
  }
}
