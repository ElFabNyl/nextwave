import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nextwave/models/user.dart';
import 'package:nextwave/services/app_url_constants_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationApiService {
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
      //we will keep also his name to display it where need
      sharedPreferences.remove('token');
      sharedPreferences.setString('token', jsonDecode(response.body)['token']);
      sharedPreferences.setString(
          'name', jsonDecode(response.body)['user']['last_name']);
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception(response.body);
    }
  }

  ///this function login an existing user to the app
  ///@params: email, password
  static Future<Object> login(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var url = Uri.parse(AppUrl.login);
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    final response = await http.post(url, body: body, headers: AppUrl.headers);
    if (response.statusCode == 200) {
      sharedPreferences.remove('token');
      sharedPreferences.setString('token', jsonDecode(response.body)['token']);
      sharedPreferences.setString(
          'name', jsonDecode(response.body)['user']['last_name']);
      return User.fromJson(jsonDecode(response.body));
    } else {
      sharedPreferences.setBool('status', false);
      return Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
          "The user does not exist. Try again with good credentials!",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));
      // throw Exception(response.body);
    }
  }

  ///this function is to check if the user is connected or not
  ///@params: email, password

  static checkConnection() async {
    SharedPreferences connexionCheck = await SharedPreferences.getInstance();
    if (!connexionCheck.containsKey('token')) {
      return false;
    } else {
      return true;
    }
  }

  ///this function is to verify the email for the reset assword
  ///@params: email, device type

  static Future<Object> verifyEmail(String email) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse(AppUrl.forgotPassword);
    var body = jsonEncode({
      'email': email,
      'device': 'mobile',
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);
    //
    if (response.statusCode == 200 && response.body.isNotEmpty) {
      //
      return response.body;
    } else if (response.statusCode == 200 && response.body.isEmpty) {
      //
      sharedPreferences.setBool('status', false);
      return Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
          "Please, enter the email you used while registering !",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7));
    } else {
      //
      return Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
          "An error has occured! Please try later",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7));
      // throw Exception(response.body);
    }
  }

  ///this function will check the OTP code that the use has received via email
  ///to check the validity of the mail before the reset password process
  ///@params: email, opt
  static verifyOtpSendedByEmail(String email, String otpCode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var url = Uri.parse(AppUrl.verifyOtp);
    var body = jsonEncode({
      'email': email,
      'otp': otpCode,
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      sharedPreferences.setBool('status', false);
      return Get.snackbar("NEXTWAVE XPRESS NOTIFICATION",
          "The verification code is invalid. Try later !",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7));
      // throw Exception(response.body);
    }
  }

  /// this function is to reset the password of a user after verification of his email
  /// @params : email, new_password
  ///
  static resetPassword(String email, String newPassword) async {
    var url = Uri.parse(AppUrl.resetPassword);
    var body = jsonEncode({
      'email': email,
      'password': newPassword,
      'device': 'mobile',
    });
    final http.Response response =
        await http.post(url, headers: AppUrl.headers, body: body);
    if (response.statusCode == 200) {
      return Get.snackbar(
          "NEXTWAVE XPRESS NOTIFICATION", "successfull password reset. you can connect with your new credential",
          icon: const Icon(Icons.check, color: Colors.green),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 10));
    } else {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setBool('status', false);
      return Get.snackbar(
          "NEXTWAVE XPRESS NOTIFICATION", "an error has occured. Try later !",
          icon: const Icon(Icons.error, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 7));
    }
  }
  /// this function is to connect the user using google
  /// 
  
}
