class APIUrls {
  static const baseUrl = 'https://project_template.test.gen-tec.net';
}

class ApiEndPoints {
  static const login = "${APIUrls.baseUrl}/users/login";
  static const register = "${APIUrls.baseUrl}/users/register";
  static const sendOtp = "${APIUrls.baseUrl}/phone";
  static const loginWithOtp = "${APIUrls.baseUrl}/loginWithOtp";
  static const getUser = "${APIUrls.baseUrl}/users/me";

  static const issueOtp = "${APIUrls.baseUrl}/users/issue-otp";
  static const verifyOtpEmail = "${APIUrls.baseUrl}/users/verify-email";
  static const refreshAccessTokenUser =
      "${APIUrls.baseUrl}/users/refresh-token";
  static const logOutUser = "${APIUrls.baseUrl}/users/logout";
}
