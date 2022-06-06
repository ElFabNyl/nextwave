class AppUrl {
  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    'Accept': 'application/json',
  };

  static const String baseUrl = 'https://nextwave.pixel.cm/api';
  static const String login = baseUrl + '/login';
  static const String register = baseUrl + '/register';
  static const String forgotPassword = baseUrl + '/forgot-password';
  static const String resetPassword = baseUrl + '/reset-password';
  static const String verifyOtp = baseUrl + '/verify-otp';
}
