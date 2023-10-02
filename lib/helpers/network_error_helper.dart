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
      // case null:
      //   return AppFailures.defaultFailure;
      // default:
      //   return Failure(code: 9999, messageEn: failureMessageFromBackEnd, messageAr: failureMessageFromBackEnd);
    default:
    return AppFailures.defaultFailure;
    }
  }

  static convertExceptionsToFailure(e) {
    if (e is Exception) {
      if (e is SocketException) {
        throw AppFailures.socketFailure;
      } else {
        throw AppFailures.defaultFailure;
      }
    }else if(e is Failure){
      return e;
    } else {
      throw AppFailures.defaultFailure;
    }
  }
}
