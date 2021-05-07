import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locker/screens/sign_in/loginModel.dart';

Future loginUser(String userName, String password) async {
  String url = "https://smart-locker-api.azurewebsites.net/api/Account/login";
  final response = await http.post(url,
     headers: {
        "accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode({'userName': userName, 'password': password}));
  var convertedDatatoJson = jsonDecode(response.body);
  return convertedDatatoJson;
}
