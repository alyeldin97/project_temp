class FailureCodes {
  static const int defaultFailure = 1;
  static const int invalidEmailAndPasswordCombination = 2;
  static const int userNotFound = 3;
  static const int weakPassword = 4;
  static const int emailAlreadyInUse = 5;
  static const int account_exists_with_different_credentials = 6;
  static const int socket = 7;
  static const int facebookCancelled = 8;
  static const int invalidEmail = 9;
  static const int takenEmail = 10;
  static const int thisNumberIsNotRegistered = 11;
  static const int invalidOtp = 12;
}

class FailureMessages {
  static const String defaultFailure = 'An UnExpected Error Occured';
  static const String invalidEmailEn =
      'Email / Password you entered is invalid';
  static const String takenEmailEn =
      'The email you entered is already registered';
  static const String socket = 'Please Check Your Internet Connection';
  static const String thisNumberIsNotRegisteredEn =
      'This number is not registered';
  static const String invalidOtpEn = 'This otp you entered is invalid';

  static const String defaultFailureAr = 'حدث عطل غير متوقع';
  static const String facebookCancelled = 'تم اغلاق النافذة';
  static const String invalidEmailAndPasswordCombination =
      'الميل او كلمة السر غير صحيحة';
  static const String userNotFound = 'لا يوجد مستخدم بهذا الميل';
  static const String weakPassword = 'كلمة السر ضعيفة';
  static const String emailAlreadyInUse = 'هذا الميل بالفعل مشترك';
  static const String socketAr = 'يرجي التأكد من توصيل الإنترنت';
  static const String invalidEmailAr =
      'البريد الإلكتروني او كلمة السر الذي أدخلته غير صحيح';
  static const String takenEmailAr =
      'البريد الإلكتروني الذي أدخلته مسجل بالفعل';
  static const String thisNumberIsNotRegisteredAr = 'هذا الرقم غير مسجل';
  static const String invalidOtpAr = 'كلمة المرور التي أدخلتها غير صحيحة';
}
