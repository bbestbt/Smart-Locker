import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locker/screens/sign_in/login.dart';
import 'package:locker/screens/sign_up/account.dart';

class APIService{
  Future<LoginResponse> login(LoginRequest requestModel) async{
    String url="smart-locker-api.azurewebsites.net/api/Account/login";

    final response=await http.post(url,body:requestModel.toJson());
    if(response.statusCode==200||response.statusCode==400){
      return LoginResponse.fromJson(json.decode(response.body));
    }else{
      throw Exception('failed to load data');
    }
  }
}