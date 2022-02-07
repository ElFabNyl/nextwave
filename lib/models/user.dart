import 'dart:convert';

class User {
  int id;
  String email;
  String phone;
  String name;
  User(
      {required this.id,
      required this.email,
      required this.phone,
      required this.name});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        phone: json['phone'],
        name: json['name']);
  }
}
