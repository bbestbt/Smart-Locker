import 'package:flutter/material.dart';
import 'package:locker/components/custom_suffix_icon.dart';
import 'package:locker/components/default_button.dart';
import 'package:locker/components/form_error.dart';
import 'package:locker/constants.dart';
import 'package:locker/screens/forgot_password/forgot_password_screen.dart';
import 'package:locker/screens/homepage/home_screen.dart';
import 'package:locker/size_config.dart';


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
            height: getProportionateScreenWidth(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenWidth(20),
          ),
         
          Row(children: [
            Checkbox(value: remember, activeColor: kPrimaryColor,onChanged: (value){
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
      cursorColor: kPrimaryColor,
      obscureText: true,
      onSaved: (newValue)=>password=newValue,
      onChanged: (value) {
         if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        
        filled: true,
        fillColor: kPrimaryLightColor,
        // labelText: "password",
        // labelStyle: TextStyle(color: kPrimaryColor),
        hintText: "Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:Icon(Icons.lock),
        // CustomSuffixIcon(
        //   svgIcon: "assets/icons/Lock.svg",
        // ),
      ),
    );
  }

  TextFormField buildUsernameFormField() {
    return TextFormField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.name,
      onSaved: (newValue) => username = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kNamelNullError)) {
          setState(() {
            errors.remove(kNamelNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kNamelNullError)) {
          setState(() {
            errors.add(
                // "please enter username"
                kNamelNullError);
          });
          //}
          // else if (!emailValidatorRegExp.hasMatch(value) &&
          //     !errors.contains(kInvalidEmailError)){
          //       setState(() {
          //         errors.add(kInvalidEmailError);
          //       });
        }
        return null;
      },
      decoration: InputDecoration(
        // labelText: "username",
        hintText: "Username",
        filled: true,
        fillColor: kPrimaryLightColor,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:Icon(Icons.person)
        //  CustomSuffixIcon(
        //   svgIcon: "assets/icons/User.svg",
        // ),
      ),
    );
  }
}
