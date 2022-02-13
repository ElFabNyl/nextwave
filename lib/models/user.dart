import 'dart:convert';

class User {
  String userName;
  String phone;
  String email;
  String password;

  User({
    required this.email,
    required this.password,
    required this.phone,
    required this.userName,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'].toString(),
      phone: json['phone'].toString(),
      email: json['email'].toString(),
      password: json['password'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "phone": phone,
        "password": password,
        "email": email,
      };
}
