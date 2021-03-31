import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/OTP/otp_screen.dart';


class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String username;
  String email;
  String phone;
  String password;
  String confirm_password;
  final List<String> errors = [];

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
          padding:
              EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              buildUsernameFormField(),
              SizedBox(height: 20),
              buildEmailFormField(),
              SizedBox(height: 20),
              buildPhoneNumberFormField(),
              SizedBox(height:20),
              buildPasswordFormField(),
              SizedBox(height: 20),
              buildConfirmPasswordFormField(),
              FormError(errors: errors),
              SizedBox(height: 20),
              DefaultButton(
                text: "Register",
                press: () {
                  if (_formKey.currentState.validate()) {
                    //go to profile page
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  }
                },
              ),
            ],
          ),
        ));
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      cursorColor: Color(0xFF6F35A5),
      //keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
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
      obscureText: true,
      onSaved: (newValue) => confirm_password = newValue,
      onChanged: (value) {
        if (password == confirm_password) {
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
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 6) {
          removeError(error: "Password is too short");
        }
        else if (RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
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
        }
        else if (!(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')).hasMatch(value)) {
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
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: "Please Enter your email");
        } else if (RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
          removeError(error: "Please Enter Valid Email");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your email");
          return "";
        } else if (!(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")).hasMatch(value)) {
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
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phone = newValue,
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
        suffixIcon:Icon(Icons.phone),
      ),
    );
  }

}
