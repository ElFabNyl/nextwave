class AppUrl {
  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
    'Accept': 'application/json',
  };

  static const String baseUrl = 'https://nextwaveapi.communedebokito.com/api';
  static  String login = baseUrl + '/login';
  static const String register = baseUrl + '/register';
}
