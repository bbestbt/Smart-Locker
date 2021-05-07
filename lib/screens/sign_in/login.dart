import 'package:flutter/cupertino.dart';

class LoginResponse {
  final String error;

  LoginResponse({this.error});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(error: json['error'] != null ? json['error'] : "");
  }
}

class LoginRequest {
  // final int id;
  String userName;
  String password;


  LoginRequest(
      {@required this.userName,
      @required this.password,
 
      });


  Map<String, dynamic> toJson() {

    Map<String, dynamic> map = {
      'userName': userName.trim(),
      'password': password.trim(),
    };
    return map;
  }
}
