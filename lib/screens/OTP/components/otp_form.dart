import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/otpModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:locker/screens/sign_in/sign_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpForm extends StatefulWidget {
  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String email = '';
  var response;
  Future resendCode(String code) async {
    getEmail();
    var response = await http.get(
        Uri.https('smart-locker-api.azurewebsites.net', 'api/Account/resend-code'),
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
          "email": email,
        },
       );
    // print(email);
    if (response.statusCode == 200) {
      print('send new code');
    } else
      return null;
  }


  Future<OTPModel> addCode(String code) async {
    getEmail();
     response = await http.put(
        Uri.https('smart-locker-api.azurewebsites.net', 'api/Account/verify'),
        headers: {
          "accept": "application/json",
          "content-type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          'code': code,
        }));
    // print(email);
    var data = response.body;
    print(data);
    if (response.statusCode == 200) {
      // String responseString = response.body;
      // otpModelFromJson(responseString);
    } else
      return null;
  }

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email');
    });
  }

  FocusNode pin2;
  FocusNode pin3;
  FocusNode pin4;

  TextEditingController p1 = TextEditingController();
  TextEditingController p2 = TextEditingController();
  TextEditingController p3 = TextEditingController();
  TextEditingController p4 = TextEditingController();

  String c1;
  String c2;
  String c3;
  String c4;

  String code;
  OTPModel _otpModel;
  @override
  void initState() {
    super.initState();
    getEmail();
    pin2 = FocusNode();
    pin3 = FocusNode();
    pin4 = FocusNode();
  }

  @override
  void dispose() {
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  void nextBox({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: p1,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextBox(value: value, focusNode: pin2);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: p2,
                  focusNode: pin2,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextBox(value: value, focusNode: pin3);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: p3,
                  focusNode: pin3,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    nextBox(value: value, focusNode: pin4);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  controller: p4,
                  focusNode: pin4,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 24),
                  decoration: otpInputDecoration,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    pin4.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 150),
          DefaultButton(
              text: "Continue",
              press: () async {
                // print(p1.text);
                // print(p2.text);
                // print(p3.text);
                // print(p4.text);
                c1 = p1.text;
                c2 = p2.text;
                c3 = p3.text;
                c4 = p4.text;
                code = c1 + c2 + c3 + c4;
                //print(code);
                OTPModel data = await addCode(code);
                setState(() {
                  _otpModel = data;
                });
                 if (response.statusCode == 200) {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                 }
                 else {
                    return '';
                  }
             
              }),
         // Center(child: email == '' ? Text('') : Text(email)),
        ],
      ),
    );
  }
}
