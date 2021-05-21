import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/otp_screen.dart';

import 'package:locker/screens/sign_up/components/body.dart';

import 'package:get_it/get_it.dart';
import 'package:locker/screens/sign_up/registerModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

var response;
Future<DataModel> register(String userName, String password, String phoneNumber,
    String email, String confirmPassword) async {
  response = await http.post(
      Uri.https('smart-locker-api.azurewebsites.net', 'api/Account/register'),
      headers: {
        "accept": "application/json",
        "content-type": "application/json"
      },
      body: jsonEncode({
        'userName': userName,
        'password': password,
        'phoneNumber': phoneNumber,
        'email': email,
        'confirmPassword': confirmPassword
      }));
  var data = response.body;
  print(data);
  if (response.statusCode == 201) {
    String responseString = response.body;
    dataModelFromJson(responseString);
  } else if (response.statusCode == 400) {
    print('dup mail');
  } else
    return null;
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String phoneNumber;
  String password;
  String confirmPassword;
  final List<String> errors = [];
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerConfirm = TextEditingController();

  DataModel _dataModel;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildUsernameFormField(),
              SizedBox(height: 20),
              buildEmailFormField(),
              SizedBox(height: 20),
              buildPhoneNumberFormField(),
              SizedBox(height: 20),
              buildPasswordFormField(),
              SizedBox(height: 20),
              buildConfirmPasswordFormField(),
              FormError(errors: errors),
              SizedBox(height: 20),
              DefaultButton(
                  text: "Register",
                  press: () async {
                    if (_formKey.currentState.validate()) {
                      userName = _controllerUsername.text;
                      password = _controllerPassword.text;
                      phoneNumber = _controllerPhone.text;
                      email = _controllerEmail.text;
                      confirmPassword = _controllerConfirm.text;

                      // print(userName);
                      // print(password);
                      // print(phoneNumber);
                      // print(email);
                      // print(confirmPassword);

                      DataModel data = await register(userName, password,
                          phoneNumber, email, confirmPassword);
                      setState(() {
                        _dataModel = data;
                      });

                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.setString('email', _controllerEmail.text);

                      Navigator.pushNamed(context, OtpScreen.routeName);
                    }
                  }),
            ],
          ),
        ));
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      controller: _controllerUsername,
      cursorColor: Color(0xFF6F35A5),
      //keyboardType: TextInputType.name,
      onSaved: (newValue) => userName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your username");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your username");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          // labelText: "username",
          hintText: "Username",
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(Icons.person)),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      controller: _controllerConfirm,
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        if (password == confirmPassword) {
          removeError(error: "Password doesn't match");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          return "";
        } else if (password != value) {
          addError(error: "Password doesn't match");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "Confirm password",
        hintText: "Confirm password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _controllerPassword,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 6) {
          removeError(error: "Password is too short");
        } else if (RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(value)) {
          removeError(error: "Please Enter Valid Password");
        }
        password = value;
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 6) {
          addError(error: "Password is too short");
          return "";
        } else if (!(RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))
            .hasMatch(value)) {
          addError(error: "Please Enter Valid Password");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "Password",
        hintText: "Password",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your email");
        } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
          removeError(error: "Please Enter Valid Email");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your email");
          return "";
        } else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))
            .hasMatch(value)) {
          addError(error: "Please Enter Valid Email");
          return "";
        }

        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "Email",
        hintText: "Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.mail),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _controllerPhone,
      // keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your phone number");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your phone number");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "Phone Number",
        hintText: "Phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(Icons.phone),
      ),
    );
  }
}
