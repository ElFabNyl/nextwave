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
        phone: json['phone'],
        userName: json['userName']);
  }

  // for the session
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data["email"] = email;
    data["password"] = password;
    data['phone'] = phone;
    data['userName'] = userName;
    return data;
  }
}

