import 'package:flutter/cupertino.dart';

class Account {
  // final int id;
  final String userName;
  final String password;
  final String phoneNumber;
  final String email;
  final String confirmPassword;

  Account({@required this.userName,@required this.password,@required this.phoneNumber,@required this.email,@required this.confirmPassword});

  // factory Account.fromJson(Map<String, dynamic> json) {
  //   return Account(
  //     id: json['id'],
  //     username: json['userName'],
  //     password: json['password'],
  //     email: json['email'],
  //     phone: json['phoneNumber'],
  //   );
 // }
 // 
 Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      'userName': userName,
      'password': password,
      'email': email,
      'phoneNumber': phoneNumber,
      'confirmPassword':confirmPassword,
    };
}
}