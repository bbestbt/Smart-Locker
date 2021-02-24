import 'package:flutter/material.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';
import 'package:locker/screens/homepage/home_screen.dart';



class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formkey = GlobalKey<FormState>();
  String username;
  String password;
  bool remember =false;
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
      key: _formkey,
      child: Column(
        children: [
          buildUsernameFormField(),
          SizedBox(
            height: 20,
          ),
          buildPasswordFormField(),
          SizedBox(
            height: 20,
          ),
         
          Row(children: [
            Checkbox(value: remember, activeColor: Color(0xFF6F35A5),onChanged: (value){
                setState(() {
                  remember=value;
                  
                });
            
             
            }),
            Text("Remeber me"),
            Spacer(),
            GestureDetector(
              onTap:() =>Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: Text("Forgot pasword",style: TextStyle(decoration: TextDecoration.underline),)),

          ],),
           FormError(errors: errors),
          DefaultButton(
            text: "Login",
            press: () {
              if (_formkey.currentState.validate()) {
                _formkey.currentState.save();
                //valid
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      cursorColor: Color(0xFF6F35A5),
      obscureText: true,
      onSaved: (newValue)=>password=newValue,
      onChanged: (value) {
         if (value.isNotEmpty) {
          removeError(error: "Please Enter your password");
        } else if (value.length >= 8) {
          removeError(error: "Password is too short");
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: "Please Enter your password");
          return "";
        } else if (value.length < 8) {
          addError(error: "Password is too short");
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        // labelText: "password",
        // labelStyle: TextStyle(color: Color(0xFF6F35A5)),
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:Icon(Icons.lock),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      cursorColor: Color(0xFF6F35A5),
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains("Please Enter your username")) {
          setState(() {
            errors.remove("Please Enter your username");
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains("Please Enter your username")) {
          setState(() {
            errors.add(
                "Please Enter your username");
          });
  
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "username",
        hintText: "Username",
        filled: true,
        fillColor: Color(0xFFF1E6FF),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:Icon(Icons.person)
      ),
    );
  }
}
