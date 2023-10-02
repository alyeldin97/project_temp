import '../../configs/constants/validator_messages.dart';

class AppValidators {
  static String? validateEmail(String? email) {
    bool emailIsNotValid = email != null &&
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email);
    if (emailIsNotValid) {
      return ValidatorMessages.email;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password != null && password.length <= 8) {
      return ValidatorMessages.password;
    }
    return null;
  }

  static String? noValidator(String? value) {
    return null;
  }

  static String? validateConfirmPassword(
      String? passwordConfirmation, password) {
    if (password != null &&
        passwordConfirmation != null &&
        password != passwordConfirmation) {
      return ValidatorMessages.confirmPassword;
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    int phoneNumberLength = 10;
    if (phoneNumber != null && phoneNumber.length != phoneNumberLength) {
      return ValidatorMessages.phone;
    }
    return null;
  }

  static String? validateName(String? name) {
    if (name != null && name.isEmpty) {
      return ValidatorMessages.required;
    }
    return null;
  }

  static String? defaultValidator(String? text) {
    if (text!.isEmpty) {
      return ValidatorMessages.required;
    }
    return null;
  }

  static String? validateOtp(String? otp) {
    if (otp != null && otp.length != 6) {
      return ValidatorMessages.phone;
    }
    return null;
  }
}
