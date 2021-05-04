import 'package:http/http.dart' as http;
import 'package:locker/apiResponse.dart';
import 'dart:convert';

import 'package:locker/screens/sign_up/account.dart';

class AccountService {
  static const API = 'https://smart-locker-api.azurewebsites.net';
  static const headers = {
    'Content-Type': 'application/json'
  };

Future<APIResponse<bool>> createAccount(Account item) {
    return http.post(API + '/api/Account/register', headers: headers, body: json.encode(item.toJson())).then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }
}