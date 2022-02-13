import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nextwave/models/user.dart';
import 'package:nextwave/services/app_url_constants_service.dart';

class Api {
  static Future<User> register(
      String email, String password, String username, String phone) async {
    var url = Uri.parse(AppUrl.register);
    var body = jsonEncode({
      'email': email,
      'password': password,
      'username': username,
      'phone': phone
    });

    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    if (response.statusCode == 201 ) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
 
      
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to register the user.');
    }
  }

  Future<dynamic> login(String email, String password) async {
    try {
      var url = Uri.parse(AppUrl.login);
      var response = await http.post(url, body: {
        'email': email,
        'password': password,
        'token': '',
        'userID': ''
      });
      return response.body;
    } finally {
      // do something here
    }
  }
}
