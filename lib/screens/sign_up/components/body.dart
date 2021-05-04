import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/sign_up/account.dart';
import 'package:locker/screens/sign_up/components/sign_up_form.dart';
import 'package:http/http.dart' as http;

// Future<Account> createAccount(String username,String email,String phone,String password) async {
//   final response = await http.post(
//     Uri.https('https://smart-locker-api.azurewebsites.net/', '/api/Account/register'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'userName': username,
//       'email': email,
//       'phoneNumber': phone,
//       'password': password,
//     }),
//   );
//   if (response.statusCode == 201) {
//     // If the server did return a 201 CREATED response,
//     // then parse the JSON.
//     return Account.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     throw Exception('Failed to load account');
//   }
// }


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
              child: Column(
          children: [
            Text("Register account", style: headingStyle),
            Text("Complete your details",textAlign: TextAlign.center,),
            SizedBox(height:50),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}
