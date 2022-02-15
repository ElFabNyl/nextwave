import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nextwave/models/user.dart';
import 'package:nextwave/services/app_url_constants_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {


  /// function that register the user to the DataBase through the API
  /// @params: userName, phone, email, password
  static Future<User> register(
      String userName, String phone, String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(AppUrl.register);
    var body = jsonEncode({
      'last_name': userName,
      'phone': phone,
      'email': email,
      'password': password,
    });

    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.

      //we keep the token of the user so as to keep him logged in
      sharedPreferences.setString('token', jsonDecode(response.body)['token']);
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }



  ///this function login an existing user to the app
  ///@params: email, password
  static Future<dynamic> loginWithEmailAndPassword(String email, String password) async {
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
  
  ///this function is to check if the user is connected or not
  ///@params: email, password
  
   

}
