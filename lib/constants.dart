import 'package:flutter/material.dart';
import 'package:locker/size_config.dart';
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
// const kPrimaryColor = Color(0xFFFF7643);
// const kPrimaryLightColor = Color(0xFFFFECDF);
// const kPrimaryGradientColor = LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
// );
// const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);


// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your username";
const String kPhoneNumberNullError = "Please Enter your phone number";
final headingStyle= TextStyle(
    fontSize: getProportionateScreenWidth(30),
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height:1.5);

final otpInputDecoration =InputDecoration(
            contentPadding:EdgeInsets.symmetric(vertical:getProportionateScreenWidth(10)) ,
            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            border:outlineInputBorder(),
            );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: kTextColor),
          );
} 