import 'dart:convert';

class User {
  String email;
  String password;
  String userName;
  String phone;
  User(
      {required this.email,
      required this.password,
      required this.phone,
      required this.userName});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'],
        password: json['password'],
        userName: json['userName'],
        phone: json['phone']);
        
  }
}
