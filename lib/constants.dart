import 'package:flutter/material.dart';

final headingStyle= TextStyle(
    fontSize:30,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height:1.5);

final otpInputDecoration =InputDecoration(
            contentPadding:EdgeInsets.symmetric(vertical:10) ,
            enabledBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            border:outlineInputBorder(),
            );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color:  Color(0xFF757575)),
          );
} 