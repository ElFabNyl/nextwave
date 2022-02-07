class AppUrl {
  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };

  static const String baseUrl = 'https://nextwaveapi.communedebokito.com/api/';
  static const String login = baseUrl + '/login';
  static const String register = baseUrl + '/register';
}
