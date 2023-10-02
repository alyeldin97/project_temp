import '../configs/constants/failure.dart';

class Failure {
  int code;
  String messageEn;
  String messageAr;
  Failure({
    required this.code,
    required this.messageEn,
    required this.messageAr,
  });
}

class AppFailures {
  static Failure defaultFailure = Failure(
    code: FailureCodes.defaultFailure,
    messageEn: FailureMessages.defaultFailure,
    messageAr: FailureMessages.defaultFailure,
  );
  static Failure invalidEmail = Failure(
    code: FailureCodes.invalidEmail,
    messageEn: FailureMessages.invalidEmailEn,
    messageAr: FailureMessages.invalidEmailAr,
  );
  static Failure takenEmail = Failure(
    code: FailureCodes.takenEmail,
    messageEn: FailureMessages.takenEmailEn,
    messageAr: FailureMessages.takenEmailAr,
  );
  static Failure socketFailure = Failure(
    code: FailureCodes.socket,
    messageEn: FailureMessages.socket,
    messageAr: FailureMessages.socket,
  );
  static Failure thisNumberIsNotRegistered = Failure(
    code: FailureCodes.thisNumberIsNotRegistered,
    messageEn: FailureMessages.thisNumberIsNotRegisteredEn,
    messageAr: FailureMessages.thisNumberIsNotRegisteredAr,
  );

  static Failure invalidOtp = Failure(
    code: FailureCodes.invalidOtp,
    messageEn: FailureMessages.invalidOtpEn,
    messageAr: FailureMessages.invalidOtpAr,
  );

  static Failure socket = Failure(
    code: FailureCodes.invalidOtp,
    messageEn: FailureMessages.socket,
    messageAr: FailureMessages.socketAr,
  );
}
