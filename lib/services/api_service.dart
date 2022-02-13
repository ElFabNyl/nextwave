import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nextwave/models/user.dart';
import 'package:nextwave/services/app_url_constants_service.dart';

class Api {
  static Future<User> register(
      String userName, String phone, String email, String password) async {
    var url = Uri.parse(AppUrl.register);
    var body = jsonEncode({
      'last_name': userName,
      'phone': phone,
      'email': email,
      'password': password,
      
    });

    print(body);

    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.body);
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
